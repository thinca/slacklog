fn auto_snippet(buffer: &str) {
    let snippets = Settings::new().unwrap().snippets;
    let placeholder = r"\{\{.*\}\}";
    let mut is_expanded = false;

    for snippet in snippets {
        if snippet.keyword == buffer {
            is_expanded = true;

            let snippet = snippet.snippet;

            let re = Regex::new(placeholder).unwrap();
            let mat = re.find(&snippet);

            let (snippet, cursor) = match mat {
                Some(mat) => (re.replace(&snippet, "").to_string(), mat.start()),
                None => {
                    let cursor = snippet.len() + 1;
                    (snippet, cursor)
                }
            };

            println!("success");
            println!("{} ", snippet);
            println!("{}", cursor);
            break;
        }
    }

    if !is_expanded {
        println!("failure")
    }
}
