use std::fs;
use std::io;

fn readdir(path: String) -> Result<Vec<String>, io::Error> {
    let r = fs::read_dir(path)?;
    let mut files: Vec<String> = r
        .flatten()
        .flat_map(|e| e.file_name().into_string())
        .collect();
    files.sort();
    return Ok(files);
}

fn main() {
    let files = readdir(".".to_string()).unwrap();
    for f in files.iter() {
        println!("{}", f);
    }
}