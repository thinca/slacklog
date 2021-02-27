  export namespace events {
    export const cursor: CursorPosition
    export function on(event: EmptyEvents | AllEvents[], handler: () => EventResult, thisArg?: any, disposables?: Disposable[]): Disposable
    /**
     * Attach handler to buffer events.
     */
    export function on(event: BufEvents, handler: (bufnr: number) => EventResult, thisArg?: any, disposables?: Disposable[]): Disposable
    /**
     * Attach handler to mouse move events.
     */
    export function on(event: MoveEvents, handler: (bufnr: number, cursor: [number, number]) => EventResult, thisArg?: any, disposables?: Disposable[]): Disposable
    /**
     * Attach handler to TextChangedI or TextChangedP.
     */
    export function on(event: InsertChangeEvents, handler: (bufnr: number, info: InsertChange) => EventResult, thisArg?: any, disposables?: Disposable[]): Disposable
    /**
     * Attach handler to window event.
     */
    export function on(event: WindowEvents, handler: (winid: number) => EventResult, thisArg?: any, disposables?: Disposable[]): Disposable
    /**
     * Attach handler to float button click.
     */
    export function on(event: 'FloatBtnClick', handler: (bufnr: number, index: number) => EventResult, thisArg?: any, disposables?: Disposable[]): Disposable
    export function on(event: 'TextChanged', handler: (bufnr: number, changedtick: number) => EventResult, thisArg?: any, disposables?: Disposable[]): Disposable
    export function on(event: 'TaskExit', handler: (id: string, code: number) => EventResult, thisArg?: any, disposables?: Disposable[]): Disposable
    export function on(event: 'TaskStderr' | 'TaskStdout', handler: (id: string, lines: string[]) => EventResult, thisArg?: any, disposables?: Disposable[]): Disposable
    export function on(event: 'BufReadCmd', handler: (scheme: string, fullpath: string) => EventResult, thisArg?: any, disposables?: Disposable[]): Disposable
    export function on(event: 'VimResized', handler: (columns: number, lines: number) => EventResult, thisArg?: any, disposables?: Disposable[]): Disposable
    export function on(event: 'Command', handler: (name: string) => EventResult, thisArg?: any, disposables?: Disposable[]): Disposable
    export function on(event: 'MenuPopupChanged', handler: (event: PopupChangeEvent, cursorline: number) => EventResult, thisArg?: any, disposables?: Disposable[]): Disposable
    export function on(event: 'CompleteDone', handler: (item: VimCompleteItem) => EventResult, thisArg?: any, disposables?: Disposable[]): Disposable
    export function on(event: 'InsertCharPre', handler: (character: string) => EventResult, thisArg?: any, disposables?: Disposable[]): Disposable
    export function on(event: 'FileType', handler: (filetype: string, bufnr: number) => EventResult, thisArg?: any, disposables?: Disposable[]): Disposable
    export function on(event: 'BufWinEnter' | 'BufWinLeave', handler: (bufnr: number, winid: number) => EventResult, thisArg?: any, disposables?: Disposable[]): Disposable
    export function on(event: 'DirChanged', handler: (cwd: string) => EventResult, thisArg?: any, disposables?: Disposable[]): Disposable
    export function on(event: 'OptionSet' | 'GlobalChange', handler: (option: string, oldVal: OptionValue, newVal: OptionValue) => EventResult, thisArg?: any, disposables?: Disposable[]): Disposable
    export function on(event: 'InputChar', handler: (session: string, character: string, mode: number) => EventResult, thisArg?: any, disposables?: Disposable[]): Disposable
    export function on(event: 'PromptInsert', handler: (value: string, bufnr: number) => EventResult, thisArg?: any, disposables?: Disposable[]): Disposable
  }
