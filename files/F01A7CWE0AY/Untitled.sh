  # install
  alias pac-update='sudo pacman -Sy'
  alias pac-upgrade='sudo pacman -Syu'
  alias pac-upgrade-force='sudo pacman -Syyu'
  alias pac-install='sudo pacman -S'
  alias pac-remove='sudo pacman -Rs'
  # search remote package
  alias pac-search='sudo pacman -Ss'
  alias pac-package-info='sudo pacman -Si'
  # search local package
  alias pac-installed-list='sudo pacman -Qs'
  alias pac-installed-package-info='sudo pacman -Qi'
  alias pac-installed-list-export='sudo pacman -Qqen' # import: sudo pacman -S - < pkglist.txt
  alias pac-installed-files='sudo pacman -Ql'
  alias pac-unused-list='sudo pacman -Qtdq'
  alias pac-search-from-path='sudo pacman -Qqo'
  # search package from filename
  alias pac-included-files='sudo pacman -Fl'
  alias pac-search-by-filename='sudo pkgfile'
  # log
  alias pac-log='cat /var/log/pacman.log | \grep "installed\|removed\|upgraded"'
  alias pac-aur-packages='sudo pacman -Qm'
  # etc
  alias pac-clean='sudo pacman -Sc'
  # aur
  if builtin command -v yay > /dev/null 2>&1; then
    alias yay-installed-list='yay -Qm'
    alias yay-clean='yay -Sc'
  fi
