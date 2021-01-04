use std::collections::HashMap;

use serde::Deserialize;

use config::{Config, ConfigError, File, Value};

const SETTING_TYPE: &'static [&'static str] = &["completions", "snippets"];

fn main() {
    let settings = Settings::new().unwrap();
    dbg!(settings);
}

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

        for setting_type in SETTING_TYPE {
            let _ = match settings.get_array(setting_type) {
                Ok(_) => &mut settings,
                Err(_) => {
                    let v: Vec<HashMap<String, Value>> = vec![];
                    settings.set(setting_type, v).unwrap()
                }
            };
        }

        settings.try_into()
    }
}
