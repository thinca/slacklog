const directlyConverter = (line: string) => line
const createDirectProcessor = processorCreator(directlyConverter)

const directOpenFileProcessors: Processors = {
  "": createDirectProcessor(editProcess),
  "ctrl-x": createDirectProcessor(splitProcess),
  "ctrl-v": createDirectProcessor(vsplitProcess),
  "ctrl-t": createDirectProcessor(tabeditProcess),
  "ctrl-q": createDirectProcessor(exportQuickfixProcess)
}

const splitSpacePopConverter = (line: string) => line.split(" ").pop() as string
const createSplitSpacePopProcessor = processorCreator(splitSpacePopConverter)

const splitSpacePopOpenFileProcessors: Processors = {
  "": createSplitSpacePopProcessor(editProcess),
  "ctrl-x": createSplitSpacePopProcessor(splitProcess),
  "ctrl-v": createSplitSpacePopProcessor(vsplitProcess),
  "ctrl-t": createSplitSpacePopProcessor(tabeditProcess),
  "ctrl-q": createSplitSpacePopProcessor(exportQuickfixProcess)
}
