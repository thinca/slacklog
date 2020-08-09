#undef HAVE_STRINGS_H
#undef HAVE_INTTYPES_H
#undef HAVE_STDALIGN_H
#undef HAVE_UNISTD_H
#undef HAVE_INT128_T
#undef HAVE_VA_ARGS_MACRO
#undef HAVE_BUILTIN___BUILTIN_CHOOSE_EXPR_CONSTANT_P
#undef HAVE_BUILTIN___BUILTIN_ALLOCA_WITH_ALIGN
#undef RUBY_SYMBOL_EXPORT_BEGIN
#undef RUBY_SYMBOL_EXPORT_END
#undef rb_pid_t
#define rb_pid_t int
#define ssize_t __int64
#define inline __inline
#undef  NORETURN
#define NORETURN(x) x
#undef  RUBY_ALIGNAS
#define RUBY_ALIGNAS(x)
#undef  CONSTFUNC
#define CONSTFUNC(x) x
#undef  PUREFUNC
#define PUREFUNC(x) x
#undef  DEPRECATED_BY
#define DEPRECATED_BY(n, x)
