#!/bin/bash
set -Ceuo pipefail

DEPEND_COMMANDS=("git" "curl" "wget" "jq")

for cmd in "${DEPEND_COMMANDS[@]}"
do
  if ! type "${cmd}" > /dev/null 2>&1; then
    echo "Command Not Found ${cmd}. Please Install ${cmd}."
    exit 1
  fi
done

DOT_DIRECTORY=${HOME}/dotfiles
HACKGEN_FONT_REPO="yuru7/HackGen"
GITHUB_API_URL="https://api.github.com/repos/${HACKGEN_FONT_REPO}/releases"
LATEST_HACKGEN_SUMMARY=$(curl -s "${GITHUB_API_URL}")
LATEST_HACKGEN_VERSION=$(echo "${LATEST_HACKGEN_SUMMARY}" | jq -r '.[0].tag_name')
LATEST_HACKGEN_DOWNLOAD_URL=$(echo "${LATEST_HACKGEN_SUMMARY}" | jq -r '.[0].assets[] | select(.name | test("HackGen_.*\\.zip")) | .browser_download_url')
LATEST_HACKGEN_NERD_DOWNLOAD_URL=$(echo "${LATEST_HACKGEN_SUMMARY}" | jq -r '.[0].assets[] | select(.name | test("HackGenNerd_.*\\.zip")) | .browser_download_url')
FONT_DIR="${HOME}/.local/share/fonts"


for f in .**?; do
  [[ ${f} = ".." ]] && continue
  [[ ${f} = ".git" ]] && continue
  [[ ${f} = ".gitignore" ]] && continue
  if [[ ${f} = ".config" ]]; then
    for cf in .config/**; do
      ln -snfv "${DOT_DIRECTORY}/${cf}" "${HOME}/${cf}"
    done
  fi
  ln -snfv "${DOT_DIRECTORY}/${f}" "${HOME}/${f}"
done
echo Deploy dotfiles done.

echo Check for Installed Fonts...
[[ -d "${FONT_DIR}/HackGen_${LATEST_HACKGEN_VERSION}" ]] || need_install=true
[[ -d "${FONT_DIR}/HackGen*}" ]] && update=true
if [ -v need_install ]; then
  if [ -v update ]; then
    OLD_VERSION=$(find "${FONT_DIR}" -name "HackGen_*" -exec basename {} \; | sed 's/HackGen_//')
  fi
  echo Installing Fonts... &&
  TMP_HACKGEN=$(mktemp) &&
  TMP_HACKGEN_NERD=$(mktemp) &&
  wget "${LATEST_HACKGEN_DOWNLOAD_URL}" -O "${TMP_HACKGEN}" &&
  unzip -d "${FONT_DIR}" "${TMP_HACKGEN}" &&
  wget "${LATEST_HACKGEN_NERD_DOWNLOAD_URL}" -O "${TMP_HACKGEN_NERD}" &&
  unzip -d "${FONT_DIR}" "${TMP_HACKGEN_NERD}" &&
  rm "${TMP_HACKGEN}" "${TMP_HACKGEN_NERD}" &&
  [ -v OLD_VERSION ] && rm -rf "${FONT_DIR}/HackGen_${OLD_VERSION} ${FONT_DIR}/HackGenNerd_${OLD_VERSION}"
  echo "Install Fonts done."
else
  echo "Nothing to do."
fi
