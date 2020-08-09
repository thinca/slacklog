root@1e86da145012:~/ImageMagick6-6.9.10-11# PKG_CONFIG_PATH=/usr/lib/x86_64-linux-gnu/pkgconfig ./configure \
>     --without-magick-plus-plus \
>     --without-perl \
>     --disable-openmp \
>     --with-gvc=no \
>     --disable-docs && \
>     --with-rsvg=yes && \
> make -j$(nproc) && make install && \
> ldconfig /usr/local/lib
checking build system type... x86_64-pc-linux-gnu
checking host system type... x86_64-pc-linux-gnu
checking target system type... x86_64-pc-linux-gnu
checking for a BSD-compatible install... /usr/bin/install -c
checking whether build environment is sane... yes
checking for a thread-safe mkdir -p... /bin/mkdir -p
checking for gawk... no
checking for mawk... mawk
checking whether make sets $(MAKE)... yes
checking whether make supports nested variables... yes
checking whether UID '0' is supported by ustar format... yes
checking whether GID '0' is supported by ustar format... yes
checking how to create a ustar tar archive... gnutar
checking whether make supports nested variables... (cached) yes
configuring ImageMagick 6.9.10-11
checking whether build environment is sane... yes
checking for style of include used by make... GNU
checking for gcc... gcc
checking whether the C compiler works... yes
checking for C compiler default output file name... a.out
checking for suffix of executables...
checking whether we are cross compiling... no
checking for suffix of object files... o
checking whether we are using the GNU C compiler... yes
checking whether gcc accepts -g... yes
checking for gcc option to accept ISO C89... none needed
checking whether gcc understands -c and -o together... yes
checking dependency style of gcc... gcc3
checking how to run the C preprocessor... gcc -E
checking for grep that handles long lines and -e... /bin/grep
checking for egrep... /bin/grep -E
checking for ANSI C header files... yes
checking for sys/types.h... yes
checking for sys/stat.h... yes
checking for stdlib.h... yes
checking for string.h... yes
checking for memory.h... yes
checking for strings.h... yes
checking for inttypes.h... yes
checking for stdint.h... yes
checking for unistd.h... yes
checking minix/config.h usability... no
checking minix/config.h presence... no
checking for minix/config.h... no
checking whether it is safe to define __EXTENSIONS__... yes
checking for ar... ar
checking the archiver (ar) interface... ar
checking for gcc... (cached) gcc
checking whether we are using the GNU C compiler... (cached) yes
checking whether gcc accepts -g... (cached) yes
checking for gcc option to accept ISO C89... (cached) none needed
checking whether gcc understands -c and -o together... (cached) yes
checking dependency style of gcc... (cached) gcc3
checking for g++... g++
checking whether we are using the GNU C++ compiler... yes
checking whether g++ accepts -g... yes
checking dependency style of g++... gcc3
checking for gcc option to accept ISO C99... none needed
checking for gcc option to accept ISO Standard C... (cached) none needed
checking how to run the C preprocessor... gcc -E
checking for a sed that does not truncate output... /bin/sed
checking for fgrep... /bin/grep -F
checking how to print strings... printf
checking for ld used by gcc... /usr/bin/ld
checking if the linker (/usr/bin/ld) is GNU ld... yes
checking for gcc option to accept ISO C99... (cached) none needed
checking CFLAGS for maximum warnings... -Wall
checking whether make sets $(MAKE)... (cached) yes
checking whether ln -s works... yes
checking for a sed that does not truncate output... (cached) /bin/sed
checking for gawk... (cached) mawk
checking if malloc debugging is wanted... no
checking for __attribute__... yes
checking for C compiler vendor... gnu
checking for gcc architecture flag...
checking for x86 cpuid 0 output... 16:756e6547:6c65746e:49656e69
checking for x86 cpuid 1 output... 806ec:2100800:7ffafbbf:bfebfbff
checking whether C compiler accepts -mtune=core2... yes
checking for gcc architecture flag... -mtune=core2
checking for pkg-config... /usr/bin/pkg-config
checking pkg-config is at least version 0.20... yes
checking size of size_t... 8
checking for C compiler vendor... (cached) gnu
checking if LD -Wl,--version-script works... yes
checking for linker lazyload option... none
checking whether gcc is Clang... no
checking whether pthreads work with -pthread... yes
checking for joinable pthread attribute... PTHREAD_CREATE_JOINABLE
checking whether more special flags are required for pthreads... no
checking for PTHREAD_PRIO_INHERIT... yes
checking for pthread_join using gcc -pthread ... yes
checking whether gcc is Clang... (cached) no
checking for joinable pthread attribute... (cached) PTHREAD_CREATE_JOINABLE
checking whether more special flags are required for pthreads... (cached) no
checking for PTHREAD_PRIO_INHERIT... (cached) yes
checking whether we are using the Microsoft C compiler... no
checking CL/cl.h usability... no
checking CL/cl.h presence... no
checking for CL/cl.h... no
checking OpenCL/cl.h usability... no
checking OpenCL/cl.h presence... no
checking for OpenCL/cl.h... no
checking windows.h usability... no
checking windows.h presence... no
checking for windows.h... no
checking for OpenCL library... no
checking for special C compiler options needed for large files... no
checking for _FILE_OFFSET_BITS value needed for large files... no
checking for _LARGEFILE_SOURCE value needed for large files... no
checking for BSD- or MS-compatible name lister (nm)... /usr/bin/nm -B
checking the name lister (/usr/bin/nm -B) interface... BSD nm
checking the maximum length of command line arguments... 1572864
checking how to convert x86_64-pc-linux-gnu file names to x86_64-pc-linux-gnu format... func_convert_file_noop
checking how to convert x86_64-pc-linux-gnu file names to toolchain format... func_convert_file_noop
checking for /usr/bin/ld option to reload object files... -r
checking for objdump... objdump
checking how to recognize dependent libraries... pass_all
checking for dlltool... no
checking how to associate runtime and link libraries... printf %s\n
checking for archiver @FILE support... @
checking for strip... strip
checking for ranlib... ranlib
checking command to parse /usr/bin/nm -B output from gcc object... ok
checking for sysroot... no
checking for a working dd... /bin/dd
checking how to truncate binary pipes... /bin/dd bs=4096 count=1
./configure: line 13682: /usr/bin/file: No such file or directory
checking for mt... no
checking if : is a manifest tool... no
checking for dlfcn.h... yes
checking for objdir... .libs
checking if gcc supports -fno-rtti -fno-exceptions... no
checking for gcc option to produce PIC... -fPIC -DPIC
checking if gcc PIC flag -fPIC -DPIC works... yes
checking if gcc static flag -static works... yes
checking if gcc supports -c -o file.o... yes
checking if gcc supports -c -o file.o... (cached) yes
checking whether the gcc linker (/usr/bin/ld) supports shared libraries... yes
checking whether -lc should be explicitly linked in... no
checking dynamic linker characteristics... GNU/Linux ld.so
checking how to hardcode library paths into programs... immediate
checking for shl_load... no
checking for shl_load in -ldld... no
checking for dlopen... no
checking for dlopen in -ldl... yes
checking whether a program can dlopen itself... yes
checking whether a statically linked program can dlopen itself... no
checking whether stripping libraries is possible... yes
checking if libtool supports shared libraries... yes
checking whether to build shared libraries... yes
checking whether to build static libraries... yes
checking how to run the C++ preprocessor... g++ -E
checking for ld used by g++... /usr/bin/ld
checking if the linker (/usr/bin/ld) is GNU ld... yes
checking whether the g++ linker (/usr/bin/ld) supports shared libraries... yes
checking for g++ option to produce PIC... -fPIC -DPIC
checking if g++ PIC flag -fPIC -DPIC works... yes
checking if g++ static flag -static works... yes
checking if g++ supports -c -o file.o... yes
checking if g++ supports -c -o file.o... (cached) yes
checking whether the g++ linker (/usr/bin/ld) supports shared libraries... yes
checking dynamic linker characteristics... (cached) GNU/Linux ld.so
checking how to hardcode library paths into programs... immediate
checking whether to enable maintainer-specific portions of Makefiles... no
checking whether gcc needs -traditional... no
checking for ANSI C header files... (cached) yes
checking whether to enable assertions... yes
checking for dirent.h that defines DIR... yes
checking for library containing opendir... none required
checking arm/limits.h usability... no
checking arm/limits.h presence... no
checking for arm/limits.h... no
checking arpa/inet.h usability... yes
checking arpa/inet.h presence... yes
checking for arpa/inet.h... yes
checking complex.h usability... yes
checking complex.h presence... yes
checking for complex.h... yes
checking errno.h usability... yes
checking errno.h presence... yes
checking for errno.h... yes
checking fcntl.h usability... yes
checking fcntl.h presence... yes
checking for fcntl.h... yes
checking limits.h usability... yes
checking limits.h presence... yes
checking for limits.h... yes
checking linux/unistd.h usability... yes
checking linux/unistd.h presence... yes
checking for linux/unistd.h... yes
checking locale.h usability... yes
checking locale.h presence... yes
checking for locale.h... yes
checking machine/param.h usability... no
checking machine/param.h presence... no
checking for machine/param.h... no
checking mach-o/dyld.h usability... no
checking mach-o/dyld.h presence... no
checking for mach-o/dyld.h... no
checking netinet/in.h usability... yes
checking netinet/in.h presence... yes
checking for netinet/in.h... yes
checking OS.h usability... no
checking OS.h presence... no
checking for OS.h... no
checking process.h usability... no
checking process.h presence... no
checking for process.h... no
checking sun_prefetch.h usability... no
checking sun_prefetch.h presence... no
checking for sun_prefetch.h... no
checking stdarg.h usability... yes
checking stdarg.h presence... yes
checking for stdarg.h... yes
checking sys/ipc.h usability... yes
checking sys/ipc.h presence... yes
checking for sys/ipc.h... yes
checking sys/mman.h usability... yes
checking sys/mman.h presence... yes
checking for sys/mman.h... yes
checking sys/resource.h usability... yes
checking sys/resource.h presence... yes
checking for sys/resource.h... yes
checking sys/sendfile.h usability... yes
checking sys/sendfile.h presence... yes
checking for sys/sendfile.h... yes
checking sys/socket.h usability... yes
checking sys/socket.h presence... yes
checking for sys/socket.h... yes
checking sys/syslimits.h usability... no
checking sys/syslimits.h presence... no
checking for sys/syslimits.h... no
checking sys/time.h usability... yes
checking sys/time.h presence... yes
checking for sys/time.h... yes
checking sys/timeb.h usability... yes
checking sys/timeb.h presence... yes
checking for sys/timeb.h... yes
checking sys/times.h usability... yes
checking sys/times.h presence... yes
checking for sys/times.h... yes
checking sys/wait.h usability... yes
checking sys/wait.h presence... yes
checking for sys/wait.h... yes
checking utime.h usability... yes
checking utime.h presence... yes
checking for utime.h... yes
checking wchar.h usability... yes
checking wchar.h presence... yes
checking for wchar.h... yes
checking xlocale.h usability... no
checking xlocale.h presence... no
checking for xlocale.h... no
checking for stdbool.h that conforms to C99... yes
checking for _Bool... yes
checking for working volatile... yes
checking for preprocessor stringizing operator... yes
checking whether stat file-mode macros are broken... no
checking whether time.h and sys/time.h may both be included... yes
checking whether struct tm is in sys/time.h or time.h... time.h
checking for struct tm.tm_zone... yes
checking whether #! works in shell scripts... yes
checking whether char is unsigned... no
checking for an ANSI C-conforming const... yes
checking for inline... inline
checking for C/C++ restrict keyword... __restrict
checking for working volatile... (cached) yes
checking whether byte ordering is bigendian... no
checking for int8_t... yes
checking for int16_t... yes
checking for int32_t... yes
checking for int64_t... yes
checking for unsigned long long int... yes
checking for long long int... yes
checking for intmax_t... yes
checking for intptr_t... yes
checking for long double... yes
checking for long double with more range or precision than double... yes
checking for long long int... (cached) yes
checking for mbstate_t... yes
checking for mode_t... yes
checking for off_t... yes
checking for pid_t... yes
checking for size_t... yes
checking for ssize_t... yes
checking for uid_t in sys/types.h... yes
checking for uint8_t... yes
checking for uint16_t... yes
checking for uint32_t... yes
checking for uint64_t... yes
checking for uintmax_t... yes
checking for uintptr_t... yes
checking for unsigned long long int... (cached) yes
checking for locale_t... no
checking for float_t... yes
checking for double_t... yes
checking size of float_t... 4
checking size of double_t... 8
checking size of float... 4
checking size of double... 8
checking size of long double... 16
checking size of signed short... 2
checking size of unsigned short... 2
checking size of signed int... 4
checking size of unsigned int... 4
checking size of signed long... 8
checking size of unsigned long... 8
checking size of signed long long... 8
checking size of unsigned long long... 8
checking size of off_t... 8
checking size of size_t... (cached) 8
checking size of ssize_t... 8
checking size of unsigned int*... 8
checking for signed 8-bit type... signed char
checking for unsigned 8-bit type... unsigned char
checking for signed 16-bit type... signed short
checking for unsigned 16-bit type... unsigned short
checking for signed 32-bit type... signed int
checking for unsigned 32-bit type... unsigned int
checking for signed 64-bit type... signed long
checking for unsigned 64-bit type... unsigned long
checking for unsigned maximum type... unsigned long
checking for pointer difference type... unsigned long
checking whether our compiler supports __func__... yes
checking whether closedir returns void... no
checking for stdlib.h... (cached) yes
checking for unistd.h... (cached) yes
checking for sys/param.h... yes
checking for getpagesize... yes
checking for working mmap... yes
checking vfork.h usability... no
checking vfork.h presence... no
checking for vfork.h... no
checking for fork... yes
checking for vfork... yes
checking for working fork... yes
checking for working vfork... (cached) yes
checking for working memcmp... yes
checking sys/select.h usability... yes
checking sys/select.h presence... yes
checking for sys/select.h... yes
checking for sys/socket.h... (cached) yes
checking types of arguments for select... int,fd_set *,struct timeval *
checking return type of signal handlers... void
checking for working strtod... yes
checking whether strerror_r is declared... yes
checking for strerror_r... yes
checking whether strerror_r returns char *... yes
checking for vprintf... yes
checking for _doprnt... no
checking for sqrt in -lm... yes
checking for library containing gethostbyname... none required
checking for library containing socket... none required
checking for acosh... yes
checking for _aligned_malloc... no
checking for asinh... yes
checking for atanh... yes
checking for atoll... yes
checking for atexit... yes
checking for cabs... yes
checking for carg... yes
checking for cimag... yes
checking for creal... yes
checking for clock... yes
checking for clock_getres... yes
checking for clock_gettime... yes
checking for ctime_r... yes
checking for directio... no
checking for erf... yes
checking for _exit... yes
checking for execvp... yes
checking for fchmod... yes
checking for floor... yes
checking for fork... (cached) yes
checking for ftime... yes
checking for ftruncate... yes
checking for getc_unlocked... yes
checking for getcwd... yes
checking for getpid... yes
checking for getexecname... no
checking for getdtablesize... yes
checking for getpagesize... (cached) yes
checking for getrlimit... yes
checking for getrusage... yes
checking for gettimeofday... yes
checking for gmtime_r... yes
checking for isnan... yes
checking for j0... yes
checking for j1... yes
checking for lltostr... no
checking for localtime_r... yes
checking for lstat... yes
checking for memmove... yes
checking for memset... yes
checking for mkstemp... yes
checking for munmap... yes
checking for nanosleep... yes
checking for newlocale... yes
checking for _NSGetExecutablePath... no
checking for pclose... yes
checking for _pclose... no
checking for poll... yes
checking for popen... yes
checking for _popen... no
checking for posix_fadvise... yes
checking for posix_fallocate... yes
checking for posix_madvise... yes
checking for posix_memalign... yes
checking for posix_spawnp... yes
checking for pow... yes
checking for pread... yes
checking for pwrite... yes
checking for qsort_r... yes
checking for raise... yes
checking for rand_r... yes
checking for readlink... yes
checking for realpath... yes
checking for select... yes
checking for seekdir... yes
checking for sendfile... yes
checking for setlocale... yes
checking for socket... yes
checking for sqrt... yes
checking for setvbuf... yes
checking for stat... yes
checking for strchr... yes
checking for strrchr... yes
checking for strcspn... yes
checking for strdup... yes
checking for strpbrk... yes
checking for strspn... yes
checking for strstr... yes
checking for strtod... (cached) yes
checking for strtod_l... yes
checking for strtol... yes
checking for strtoul... yes
checking for symlink... yes
checking for sysconf... yes
checking for sigemptyset... yes
checking for sigaction... yes
checking for spawnvp... no
checking for strerror... yes
checking for strlcat... no
checking for strlcpy... no
checking for strcasecmp... yes
checking for strncasecmp... yes
checking for telldir... yes
checking for tempnam... yes
checking for times... yes
checking for ulltostr... no
checking for uselocale... yes
checking for usleep... yes
checking for utime... yes
checking for vfprintf... yes
checking for vfprintf_l... no
checking for vsprintf... yes
checking for vsnprintf... yes
checking for vsnprintf_l... no
checking for waitpid... yes
checking for _wfopen... no
checking for _wstat... no
checking for library containing clock_gettime... none required
checking whether clock_gettime supports CLOCK_REALTIME... yes
checking whether pread is declared... yes
checking whether pwrite is declared... yes
checking whether strlcpy is declared... no
checking whether vsnprintf is declared... yes
checking for X11 configure files...
-------------------------------------------------------------
checking for BZLIB...
checking bzlib.h usability... no
checking bzlib.h presence... no
checking for bzlib.h... no
checking for BZ2_bzDecompress in -lbz2... no
checking if BZLIB package is complete... no
checking for X... libraries , headers
checking for gethostbyname... yes
checking for connect... yes
checking for remove... yes
checking for shmat... yes
checking for IceConnectionNumber in -lICE... yes
-------------------------------------------------------------
checking for X11...
checking for shmctl... yes
checking for XShmAttach in -lXext... yes
checking for XShapeCombineMask in -lXext... yes
checking for XtSetEventDispatcher in -lXt... no
-------------------------------------------------------------
checking for ZLIB... yes

-------------------------------------------------------------
checking for DPS...
checking DPS/dpsXclient.h usability... no
checking DPS/dpsXclient.h presence... no
checking for DPS/dpsXclient.h... no
checking for DPSInitialize in -ldps... no
checking for DPSInitialize in -ldps... no
checking for XDPSPixelsPerPoint in -ldpstk... no
checking if DPS package is complete... no
-------------------------------------------------------------
checking for fftw3... no

-------------------------------------------------------------
checking for FLIF...
checking flif.h usability... no
checking flif.h presence... no
checking for flif.h... no
checking for flif_create_decoder in -lflif... no
checking if FLIF package is complete... no
-------------------------------------------------------------
checking for FlashPIX...
checking fpxlib.h usability... no
checking fpxlib.h presence... no
checking for fpxlib.h... no
checking for FPX_OpenImageByFilename in -lfpx... no
checking if FlashPIX package is complete... no
-------------------------------------------------------------
checking for ddjvuapi... no

-------------------------------------------------------------
checking for FONTCONFIG... yes

-------------------------------------------------------------
checking for FREETYPE... yes

-------------------------------------------------------------
checking for RAQM... no

-------------------------------------------------------------
checking for HEIF... no

-------------------------------------------------------------
checking for JBIG...
checking jbig.h usability... yes
checking jbig.h presence... yes
checking for jbig.h... yes
checking for jbg_dec_init in -ljbig... yes
checking if JBIG package is complete... yes
-------------------------------------------------------------
checking for JPEG...
checking jconfig.h usability... yes
checking jconfig.h presence... yes
checking for jconfig.h... yes
checking jerror.h usability... yes
checking jerror.h presence... yes
checking for jerror.h... yes
checking jmorecfg.h usability... yes
checking jmorecfg.h presence... yes
checking for jmorecfg.h... yes
checking jpeglib.h usability... yes
checking jpeglib.h presence... yes
checking for jpeglib.h... yes
checking for jpeg_read_header in -ljpeg... yes
checking for JPEG library is version 6b or later... yes
checking if JPEG package is complete... yes
-------------------------------------------------------------
checking for LCMS2... no

-------------------------------------------------------------
checking for LIBOPENJP2... no

-------------------------------------------------------------
checking for LQR... no

-------------------------------------------------------------
checking for LZMA... yes

-------------------------------------------------------------
checking for OPENEXR... no

-------------------------------------------------------------
checking for PANGO... no

checking for PANGO... no

-------------------------------------------------------------
checking for PNG... yes

-------------------------------------------------------------
checking for RAW_R... no

-------------------------------------------------------------
checking for TIFF...
checking tiff.h usability... yes
checking tiff.h presence... yes
checking for tiff.h... yes
checking tiffio.h usability... yes
checking tiffio.h presence... yes
checking for tiffio.h... yes
checking for TIFFOpen in -ltiff... yes
checking for TIFFClientOpen in -ltiff... yes
checking for TIFFIsByteSwapped in -ltiff... yes
checking for TIFFReadRGBATile in -ltiff... yes
checking for TIFFReadRGBAStrip in -ltiff... yes
checking if TIFF package is complete... yes
checking tiffconf.h usability... yes
checking tiffconf.h presence... yes
checking for tiffconf.h... yes
checking for TIFFIsCODECConfigured... yes
checking for TIFFMergeFieldInfo... yes
checking for TIFFIsBigEndian... yes
checking for TIFFReadEXIFDirectory... yes
checking for TIFFSetErrorHandlerExt... yes
checking for TIFFSetTagExtender... yes
checking for TIFFSetWarningHandlerExt... yes
checking for TIFFSwabArrayOfTriples... yes
-------------------------------------------------------------
checking for WEBP... no
checking for WEBPMUX... no

checking for WMF support ...
checking for libwmf/ipa.h... no
checking if WMF package is complete ... no
-------------------------------------------------------------
checking for XML... no

-------------------------------------------------------------
checking for ImageMagick delegate programs...
checking for bpgdec... bpgdec
checking for bpgenc... bpgenc
checking for blender... blender
checking for xdg-open... no
checking for google-chrome... no
checking for firefox... no
checking for konqueror... no
checking for mozilla... no
checking for lynx... no
checking for ufraw-batch... ufraw-batch
checking for soffice... soffice
checking for dvips... dvips
checking for convert... /usr/local/bin/convert
checking for display... /usr/local/bin/display
checking for xterm... xterm
checking for dot... dot
checking for hp2xx... hp2xx
checking for html2ps... html2ps
checking for ilbmtoppm... ilbmtoppm
checking for ppmtoilbm... ppmtoilbm
checking for JxrDecApp... JxrDecApp
checking for JxrEncApp... JxrEncApp
checking for lepton... lepton
checking for lp... no
checking for lpr... lpr
checking for gimp... gimp
checking for mogrify... /usr/local/bin/mogrify
checking for avconv... avconv
checking for ffmpeg... (cached) avconv
checking for avconv... avconv
checking for ffmpeg... (cached) avconv
checking for mrsidgeodecode... mrsidgeodecode
checking for mv... /bin/mv
checking for pcl6... pcl6
checking for gsx... no
checking for gsc... no
checking for gs... no
checking for rm... /bin/rm
checking for rsvg-convert... /usr/bin/rsvg-convert
checking for inkscape... inkscape
checking for uniconvertor... uniconvertor
checking for dwebp... dwebp
checking for cwebp... cwebp
checking for curl... /usr/bin/curl
checking for gxps... gxps
checking for Apple fonts directory... not found!
checking for Dejavu fonts directory... not found!
checking for Ghostscript fonts directory... not found!
checking for URW-base35 fonts directory... not found!
checking for Windows fonts directory... not found!
checking for gnutar... no
checking for gtar... no
checking for tar... tar
checking for perl... perl
checking for rpmbuild... no
checking for rpm... no
checking for 7za... no
checking for zip... no
-------------------------------------------------------------
Update ImageMagick configuration
checking that generated files are newer than configure... done
checking that generated files are newer than configure... done
configure: creating ./config.status
config.status: creating common.shi
config.status: creating config/configure.xml
config.status: creating config/delegates.xml
config.status: creating config/ImageMagick.rdf
config.status: creating config/MagickCore.dox
config.status: creating config/MagickWand.dox
config.status: creating config/Magick++.dox
config.status: creating config/type-apple.xml
config.status: creating config/type-dejavu.xml
config.status: creating config/type-ghostscript.xml
config.status: creating config/type-urw-base35.xml
config.status: creating config/type-windows.xml
config.status: creating config/type.xml
config.status: creating ImageMagick.spec
config.status: creating Magick++/bin/Magick++-config
config.status: creating magick/ImageMagick.pc
config.status: creating Magick++/lib/ImageMagick++.pc
config.status: creating Magick++/lib/Magick++.pc
config.status: creating magick/Magick-config
config.status: creating magick/MagickCore-config
config.status: creating magick/MagickCore.pc
config.status: creating magick/version.h
config.status: creating Makefile
config.status: creating magick.sh
config.status: creating PerlMagick/check.sh
config.status: creating PerlMagick/default/Magick.pm
config.status: creating PerlMagick/Makefile.PL
config.status: creating PerlMagick/default/Makefile.PL
config.status: creating PerlMagick/quantum/Makefile.PL
config.status: creating PerlMagick/quantum/quantum.pm
config.status: creating PerlMagick/quantum/quantum.xs
config.status: creating PerlMagick/quantum/typemap
config.status: creating utilities/animate.1
config.status: creating utilities/compare.1
config.status: creating utilities/composite.1
config.status: creating utilities/conjure.1
config.status: creating utilities/convert.1
config.status: creating utilities/display.1
config.status: creating utilities/identify.1
config.status: creating utilities/ImageMagick.1
config.status: creating utilities/import.1
config.status: creating utilities/mogrify.1
config.status: creating utilities/montage.1
config.status: creating utilities/stream.1
config.status: creating wand/MagickWand-config
config.status: creating wand/MagickWand.pc
config.status: creating wand/Wand-config
config.status: creating wand/Wand.pc
config.status: creating config/config.h
config.status: config/config.h is unchanged
config.status: executing magick/magick-baseconfig.h commands
config.status: creating magick/magick-baseconfig.h - prefix MAGICKCORE for config/config.h defines
config.status: magick/magick-baseconfig.h is unchanged
config.status: executing depfiles commands
config.status: executing libtool commands
config.status: executing default commands
config.status: executing magick.sh.in commands
config.status: executing MagickCore-config.in commands
config.status: executing Magick-config.in commands
config.status: executing MagickWand-config.in commands
config.status: executing Wand-config.in commands
config.status: executing Magick++-config.in commands
config.status: executing PerlMagick/check.sh.in commands
configure:
==============================================================================
ImageMagick is configured as follows. Please verify that this configuration
matches your expectations.

  Host system type: x86_64-pc-linux-gnu
  Build system type: x86_64-pc-linux-gnu

                 Option                        Value
  ------------------------------------------------------------------------------
  Shared libraries  --enable-shared=yes         yes
  Static libraries  --enable-static=yes         yes
  Module support    --with-modules=no           no
  GNU ld            --with-gnu-ld=yes           yes
  Quantum depth     --with-quantum-depth=16     16
  High Dynamic Range Imagery
                    --enable-hdri=no            no

  Install documentation:                        no

  Delegate Library Configuration:
  BZLIB             --with-bzlib=yes            no
  Autotrace         --with-autotrace=no         no
  DJVU              --with-djvu=yes             no
  DPS               --with-dps=yes              no
  FFTW              --with-fftw=yes             no
  FLIF              --with-flif=yes             no
  FlashPIX          --with-fpx=yes              no
  FontConfig        --with-fontconfig=yes       yes
  FreeType          --with-freetype=yes         yes
  Ghostscript lib   --with-gslib=no             no
  Graphviz          --with-gvc=no
  HEIC              --with-heic=yes    no
  JBIG              --with-jbig=yes             yes
  JPEG v1           --with-jpeg=yes             yes
  LCMS              --with-lcms=yes             no
  LQR               --with-lqr=yes              no
  LTDL              --with-ltdl=yes             no
  LZMA              --with-lzma=yes             yes
  Magick++          --with-magick-plus-plus=no  no
  OpenEXR           --with-openexr=yes          no
  OpenJP2           --with-openjp2=yes          no
  PANGO             --with-pango=yes            no
  PERL              --with-perl=no              no
  PNG               --with-png=yes              yes
  RAQM              --with-raqm=yes             no
  RAW               --with-raw=yes      no
  RSVG              --with-rsvg=no              no
  TIFF              --with-tiff=yes             yes
  WEBP              --with-webp=yes             no
  WMF               --with-wmf=yes              no
  X11               --with-x=                   yes
  XML               --with-xml=yes              no
  ZLIB              --with-zlib=yes             yes

  Delegate Program Configuration:
  GhostPCL          None                                pcl6 (unknown)
  GhostXPS          None                                gxps (unknown)
  Ghostscript       None                                gs (unknown)

  Font Configuration:
  Apple fonts       --with-apple-font-dir=default
  Dejavu fonts      --with-dejavu-font-dir=default      none
  Ghostscript fonts --with-gs-font-dir=default  none
  URW-base35 fonts  --with-urw-base35-font-dir=default  none
  Windows fonts     --with-windows-font-dir=default     none

  X11 Configuration:
        X_CFLAGS        =
        X_PRE_LIBS      =  -lSM -lICE
        X_LIBS          =
        X_EXTRA_LIBS    =

  Options used to compile and link:
    PREFIX          = /usr/local
    EXEC-PREFIX     = /usr/local
    VERSION         = 6.9.10
    CC              = gcc
    CFLAGS          = -I/usr/include/libpng16  -I/usr/include/freetype2 -I/usr/include/libpng16 -I/usr/include/uuid -I/usr/include/freetype2 -I/usr/include/libpng16    -g -O2 -Wall -mtune=core2 -fexceptions -pthread -DMAGICKCORE_HDRI_ENABLE=0 -DMAGICKCORE_QUANTUM_DEPTH=16
    CPPFLAGS        =   -DMAGICKCORE_HDRI_ENABLE=0 -DMAGICKCORE_QUANTUM_DEPTH=16
    PCFLAGS         =
    DEFS            = -DHAVE_CONFIG_H
    LDFLAGS         =
    LIBS            =
    CXX             = g++
    CXXFLAGS        = -g -O2 -pthread
    FEATURES        = DPC Cipher
    DELEGATES       = mpeg fontconfig freetype jbig jng jpeg lzma png tiff x zlib
==============================================================================

bash: --with-rsvg=yes: command not found

