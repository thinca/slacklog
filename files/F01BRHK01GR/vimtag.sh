git ls-remote --heads --tags https://github.com/vim/vim.git | awk '!/({})/ {print $2}' | awk 'gsub("(refs/tags/)|(v)", "")' | sed 'h; s/[+-]/./g; s/.p\([[:digit:]]\)/.z\1/; s/$/.z/; G; s/\n/ /' | LC_ALL=C sort -t. -k 1,1 -k 2,2n -k 3,3n -k 4,4n -k 5,5n | awk '{print $2}'

