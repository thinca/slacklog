package main

import (
    "fmt"
    "os"
    "text/template"
)

func do(s string) {
    tpl := template.Must(template.New("").
        Funcs(map[string]interface{}{
            "a": func() string {
                panic("this is panic")
            },
            "b": func() (string, error) {
                return "", fmt.Errorf("this is error")
            },
        }).
        Parse(s))
    err := tpl.Execute(os.Stdout, nil)
    fmt.Printf("TEMPLATE TEXT: %s\n", s)
    fmt.Printf("Execute returns %v\n", err)
}

func main() {
    do("{{ a }}")
    do("{{ b }}")
}
