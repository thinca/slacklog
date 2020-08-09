#ifdef FEAT_PROP_POPUP
# define WIN_IS_POPUP(wp)             ((wp)->w_popup_flags != 0)
# define ERROR_IF_POPUP_WINDOW()      error_if_popup_window(FALSE)
# define ERROR_IF_ANY_POPUP_WINDOW()  error_if_popup_window(TRUE)
#else
# define WIN_IS_POPUP(wp)             (void)0
# define ERROR_IF_POPUP_WINDOW()      (void)0
# define ERROR_IF_ANY_POPUP_WINDOW()  (void)0
#endif
#if defined(FEAT_PROP_POPUP) && defined(FEAT_TERMINAL)
# define ERROR_IF_TERM_POPUP_WINDOW() error_if_term_popup_window()
#else
# define ERROR_IF_TERM_POPUP_WINDOW() (void)0
#endif

if (eap->cmdidx != CMD_pedit && ERROR_IF_POPUP_WINDOW()){
  ERROR_IF_TERM_POPUP_WINDOW();
  return;
}
