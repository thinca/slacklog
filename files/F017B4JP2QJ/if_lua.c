	case LUA_TFUNCTION:
	{
	    char_u *name;
	    lua_pushvalue(L, pos);
	    luaV_CFuncState *state = ALLOC_CLEAR_ONE(luaV_CFuncState);