export type Process = (lines: Array<string>) => void | Promise<void>

export type Processor = {
  execute: Process
}

export type Processors = {
  [key: string]: Processor
}

export const processorCreator = (convertLine: ConvertLine) => (process: Process) => ({
  execute: (lines: Array<string>) => process(lines.map((line) => convertLine(line)))
})