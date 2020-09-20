export const addUploadingFiles = (files: UploadingFile[], fieldKey: FieldKey) => (
  state: State,
): State => ({
  ...state,
  editing: {
    ...state.editing,
    uploadingFiles: state.editing.uploadingFiles.set(fieldKey, [
      ...state.editing.uploadingFiles.get(fieldKey),
      ...files,
    ]),
  },
});

export const addUploadingFiles = (files: UploadingFile[], fieldKey: FieldKey) => (
  state: State,
): State => {
  return produce(state, draft => {
    draft.editing.uploadingFiles[fieldKey] = draft.editing.uploadingFiles[fieldKey].concat(files);
  });
};