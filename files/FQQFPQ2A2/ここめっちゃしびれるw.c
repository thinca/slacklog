	case Ctrl_C:	/* End input mode */
#ifdef FEAT_CMDWIN
	    if (c == Ctrl_C && cmdwin_type != 0)
	    {
		/* Close the cmdline window. */
		cmdwin_result = K_IGNORE;
		got_int = FALSE; /* don't stop executing autocommands et al. */
		nomove = TRUE;
		goto doESCkey;
	    }
#endif
#ifdef FEAT_JOB_CHANNEL
	    if (c == Ctrl_C && bt_prompt(curbuf))
	    {
		if (invoke_prompt_interrupt())
		{
		    if (!bt_prompt(curbuf))
			// buffer changed to a non-prompt buffer, get out of
			// Insert mode
			goto doESCkey;
		    break;
		}
	    }
#endif

#ifdef UNIX
do_intr:
#endif
	    /* when 'insertmode' set, and not halfway a mapping, don't leave
	     * Insert mode */
	    if (goto_im())
	    {
		if (got_int)
		{
		    (void)vgetc();		/* flush all buffers */
		    got_int = FALSE;
		}
		else
		    vim_beep(BO_IM);
		break;
	    }
doESCkey:
	    /*
	     * This is the ONLY return from edit()!
	     */
	    /* Always update o_lnum, so that a "CTRL-O ." that adds a line
	     * still puts the cursor back after the inserted text. */
	    if (ins_at_eol && gchar_cursor() == NUL)
		o_lnum = curwin->w_cursor.lnum;

	    if (ins_esc(&count, cmdchar, nomove))
	    {
		// When CTRL-C was typed got_int will be set, with the result
		// that the autocommands won't be executed. When mapped got_int
		// is not set, but let's keep the behavior the same.
		if (cmdchar != 'r' && cmdchar != 'v' && c != Ctrl_C)
		    ins_apply_autocmds(EVENT_INSERTLEAVE);
		did_cursorhold = FALSE;
		return (c == Ctrl_O);
	    }
	    continue;
