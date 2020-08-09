# Pros of `-DPYTHON_HOME`

## "Moved" python

libpython (both of dynamic and static) and python executable has builtin `prefix` which is specified when the Python is built.

When python is executed from `python` executable, relative path from the executable is searched before the builtin `prefix`.

So if Python is installed to place different than builtin prefix, `python -c 'import sys; print(sys.prefix)'` is better than the prefix in the library.

But note that this is possible only when building vim from source.  When using prebuilt vim, `set pythonhome` is required anyway.


# Cons of `-DPYTHON_HOME`

## Hard to troubleshooting

Now we have three python home; buitlin prefix, prefix calculated from executable path, and `PYTHON_HOME`.

`PYTHON_HOME` makes troubleshooting harder, because:

* Vim behaves different than other applications linking Python.
* `vim --version` doesn't show the `PYTHON_HOME`.


## Vim may use wrong prefix if `python` command is not consistent with `--with-python-config-dir`

After long discussion, I found @justrajdeep 's inconsistent configure option.
(ref: https://github.com/vim/vim/pull/2787#issuecomment-380297786)

Automatic `-DPYTHON_HOME` made his wrong configuration works accidentally.
But it may cause random unexpected errors.  So automatic `-DPYTHON_HOME` hided real error from him, rather than help him.

I think this trouble is not rare.  Many people can make same mistake when they want to use custom Python (e.g. installed from pyenv) instead of system Python.

## It makes upgrading Python harder

Homebrew installs Python versions into separate directly, and make symlink for executable and DLL.
Tools like [stow](https://www.gnu.org/software/stow/) uses "symlink to current version" approach too.

When vim is linking python DLL through the symlink, vim can link to new Python after upgrading Python.
But `-DPYTHON_HOME` still points to old Python's real path.  It means new Python DLL uses old Python libraries.  It may make trouble too.  And Vim will abort after removing old Python.

Because of this issue, Homebrew is forced to bump Vim revision after every Python version change.
(e.g. https://github.com/Homebrew/homebrew-core/commit/91bb06305f0dfb233f42556ae0a05b5d3603348c)

MacVim official build is suffered too.  Since MacVim users use different version of homebrew (or official Python build), it's impossible to rebuild MacVim right after user upgraded Python.
Many MacVim users are suffered from ABORT caused by the `PYTHON_PATH`.


# Proposal

`-DPYTHON_HOME` is useful only for rare case ("moved python"), and `set pythonhome` can be used for such case too.  On the other hand, it makes trouble on many cases, and it makes troubleshooting harder too.

So let's Stop adding `-DPYTHON_HOME` (and `-DPYTHON3_HOME`) to CFLAGS automatically, regardless `--with-python-config-dir` is used or not.

User can still use it manually by `CFLAGS=-DPYTHON_HOME=/path/to/python-prefix`.  And it is shown in `vim --version`.