export const createGlobalVariableSelector = (store: Store) => (name: GlobalVariableName) => {
  return store.getState().vimVariable.global[name]
}

type CreateSelector<S> = (store: Store) => (key: S) => VimValue

export const selectVimVariables = <S, R>(createSelector: CreateSelector<S>) => (
  selector: (selector: ReturnType<CreateSelector<S>>) => R
) => selector(createSelector(store))

export const projectFiles = () => {
  const command = selectVimVariables<GlobalVariableName, VimValue>(createGlobalVariableSelector)((selector) =>
    selector("fzfPreviewFilelistCommand")
  )
}

export const projectFilesDefaultOptions = () =>
  selectVimVariables<GlobalVariableName, FzfOptions>(createGlobalVariableSelector)((selector) => ({
    "--prompt": '"ProjectFiles> "',
    "--multi": true,
    "--preview": `"${selector("fzfPreviewCommand")}"`
  }))
