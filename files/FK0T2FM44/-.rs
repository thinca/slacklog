    let table_file = s:DB_get("dict_table_file" )

    if table_file == ''
        exec 'DBCompleteTables'
        let table_file = s:DB_get("dict_table_file" )
    endif
