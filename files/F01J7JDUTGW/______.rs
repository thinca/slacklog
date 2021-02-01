let mut snippet = snippet.snippet;

let re = Regex::new(placeholder).unwrap();
let mat = re.find(&snippet);

let cursor = match mat {
    Some(mat) => {
        snippet = re.replace(&snippet, "").to_string();
        mat.start()
    }
    None => snippet.len() + 1,
};

println!("success");
println!("{} ", snippet);
println!("{}", cursor);
break;