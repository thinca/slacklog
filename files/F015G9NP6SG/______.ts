export type Process = (lines: Array<string>) => void

export type Processes = {
  [key: string]: Process
}

export type SingleLineConsumer = {
  consume: (line: string) => Promise<void>
  kind: "single"
}
export type BulkLineConsumer = {
  consume: (lines: Array<string>) => Promise<void>
  kind: "bulk"
}
type Consumer = SingleLineConsumer | BulkLineConsumer

export type CreateProcess = (consumer: Consumer) => { consume: Process }

export const createProcess: CreateProcess = (consumer) => ({
  execute: async (lines) => {
    if (consumer.kind === "single") {
      for (const line of lines) {
        await consumer.consume(line)
      }
    } else {
      consumer.consume(lines)
    }
  }
})