// deno run --allow-run --allow-read --allow-write or -A

const tmp = Deno.makeTempDirSync();
const vimFile = `${tmp}/vim.txt`;
const nvimFile = `${tmp}/nvim.txt`;

// from MDN
const intersection = <T>(setA: Set<T>, setB: Set<T>): Set<T> => {
  const _intersection = new Set<T>();
  for(const elem of setB) {
    if(setA.has(elem)) {
      _intersection.add(elem);
    }
  }
  return _intersection;
};

// ditto
const difference = <T>(setA: Set<T>, setB: Set<T>): Set<T> => {
  const _difference = new Set(setA);
  for(const elem of setB) {
    _difference.delete(elem);
  }
  return _difference;
}

try {
  await Deno.run({
    cmd: [
      "vim",
      "-u",
      "NONE",
      "-e",
      "-s",
      `+call writefile(getcompletion('', 'function'), '${vimFile}')`,
      "+q",
    ],
  }).status();
  await Deno.run({
    cmd: [
      "nvim",
      "-u",
      "NONE",
      "--headless",
      `+call writefile(getcompletion('', 'function'), '${nvimFile}')`,
      "+q",
    ],
  }).status();
  const vimSet = new Set(Deno.readTextFileSync(vimFile).split("\n"));
  const nvimSet = new Set(Deno.readTextFileSync(nvimFile).split("\n"));
  const common = Array.from(intersection(vimSet, nvimSet).values()).sort();
  const vimOnly = Array.from(difference(vimSet, nvimSet)).sort();
  const nvimOnly = Array.from(difference(nvimSet, vimSet)).sort();
  Deno.writeTextFileSync("fn.json", JSON.stringify({common, vimOnly, nvimOnly}));
} finally {
  Deno.removeSync(tmp, { recursive: true });
}