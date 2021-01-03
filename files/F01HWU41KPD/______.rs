extern crate serde;
extern crate serde_derive;

use config::{Config, ConfigError, File};

const SETTING_TYPE: &'static [&'static str] = &["completions", "snippets"];

#[derive(Debug, Deserialize)]
pub struct Completion {
    regexp_left: String,
    regexp_right: String,
    command: String,
    fzf_command: String,
}

#[derive(Debug, Deserialize)]
pub struct Snippet {
    keyword: String,
    snippet: String,
}

#[derive(Debug, Deserialize)]
enum SettingType {
    Completion,
    Snippet,
}

#[derive(Debug, Deserialize)]
pub struct Settings {
    completions: Vec<Completion>,
    snippets: Vec<Snippet>,
}

impl Settings {
    pub fn new() -> Result<Self, ConfigError> {
        let home_dir = match dirs::home_dir() {
            Some(path) => path,
            None => {
                println!("Home directory not found");
                std::process::exit(1);
            }
        };

        let setting_file = format!(
            "{}/.config/fzf-preview.zsh/config.yml",
            home_dir.to_str().unwrap()
        );

        let mut settings = Config::new();
        settings
            .merge(File::with_name(&setting_file).required(false))
            .unwrap();

        settings.try_into()
    }
}
