fn auto_snippet(buffer: &str) {
    let snippets = Settings::new().unwrap().snippets;
    let placeholder = r"\{\{.*\}\}";
    let mut is_expanded = false;

    for snippet in snippets {
        let keyword = Regex::new(format!(r"^{}($|\s)", &snippet.keyword).as_str()).unwrap();
        let keyword_with_space = Regex::new(format!(r"^{} ", &snippet.keyword).as_str()).unwrap();

        if keyword.is_match(buffer) {
            is_expanded = true;
            let with_space = keyword_with_space.is_match(buffer);

            let mut words = buffer.split(" ");
            words.next();

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
            if !with_space {
                println!("{} ", snippet);
            } else {
                println!("{} {} ", snippet, words.collect::<String>());
            }

            println!("{}", cursor);
            break;
        }
    }

    if !is_expanded {
        println!("failure")
    }
}
