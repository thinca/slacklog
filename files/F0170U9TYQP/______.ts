export const RESOURCE_TYPE = ["file", "line", "bufnr", "git-status", "register"] as const

export type FileData = {
  file: string
}

export type LineData = {
  file: string
  lineNumber: number
  text: string
}

export type BufnrData = {
  bufnr: number
  file: string
}

export type GitStatusData = {
  file: string
  status: string
}

export type RegisterData = {
  text: string
  option: string
}

export type ResourceData = FileData | LineData | BufnrData | GitStatusData | RegisterData

export type ResourceLine = {
  command: FzfCommandName
  type: typeof RESOURCE_TYPE[number]
  data: ResourceData
  text: string
}

export type ResourceLines = Array<ResourceLine>

export type Resource = {
  lines: ResourceLines
  options?: FzfCommandDynamicOption
}