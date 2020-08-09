function! s:DB_PGSQL_getDictionaryTable()
    let result = s:DB_PGSQL_execSql(
                \ "select ".(s:DB_get('dict_show_owner')==1?"schemaname||'.'||":'')."tablename " .
                \ " from pg_tables " .
                \ "where schemaname != 'pg_catalog' " .
                \ "order by ".(s:DB_get('dict_show_owner')==1?"schemaname, ":'')."tablename"
                \ )
    return s:DB_PGSQL_stripHeaderFooter(result)
endfunction
