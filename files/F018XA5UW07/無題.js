liberator.modules.mappings.addUserMap(
    [liberator.modules.modes.NORMAL],
    ["<C-f>"],
    "Fuzzy Tab Switch",
    function(argument){
        tab_length = liberator.modules.tabs.count;
        if(isNaN(input = parseInt(argument))){
            switch(argument){
            case "a": input = 1; break;
            case "s": input = 2; break;
            case "d": input = 3; break;
            case "f": input = 4; break;
            case "g": input = 5; break;
            case "h": input = 6; break;
            case "j": input = 7; break;
            case "k": input = 8; break;
            case "l": input = 9; break;
            case ";": input = 0; break;
                defalut:
                liberator.echoerr("Invalid input.");
                return;
            }
        }

        if(input == 0) input = 10;
        input == 1 ? fuzzy_tab_index = 1 : fuzzy_tab_index = Math.round(tab_length * input / 10);
        liberator.modules.tabs.select(fuzzy_tab_index -1);
    },
    {
        arg: true
        //flags: liberator.modules.Mappings.flags.ARGUMENT
    }
);