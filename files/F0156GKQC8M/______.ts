type ConvertLine = (line: string) => string
type Process = (lines: Array<string>) => void

export const processorCreator = (convertLine: ConvertLine) => (process: Process) => (lines: Array<string>) =>
  process(lines.map((line) => convertLine(line)))

export const createEachProcess = (process: (line: string) => void) => async (lines: Array<string>) => {
  for await (const line of lines) {
    process(line)
  }
}

export const createOnceProcess = (process: (lines: Array<string>) => void) => (lines: Array<string>) => {
  process(lines)
}

type OpenCommand = "edit" | "split" | "vsplit" | "tabedit"

const createOpenFile = (openCommand: OpenCommand) => (line: string) => {
  pluginCommand(`execute 'silent ${openCommand} ${line}'`)
}

export const editProcess = createEachProcess(createOpenFile("edit"))
export const splitProcess = createEachProcess(createOpenFile("split"))
export const vsplitProcess = createEachProcess(createOpenFile("vsplit"))
export const tabeditProcess = createEachProcess(createOpenFile("tabedit"))

export const directlyConverter = (line: string) => line
const createDirectProcessor = processorCreator(directlyConverter)

export const directOpenFileProcessors: Processors = {
  "": createDirectProcessor(editProcess),
  "ctrl-x": createDirectProcessor(splitProcess),
  "ctrl-v": createDirectProcessor(vsplitProcess),
  "ctrl-t": createDirectProcessor(tabeditProcess)
}
