

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew install --cask iterm2
brew install zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
brew install direnv
brew install --cask hammerspoon

brew install --cask visual-studio-code
brew tap databricks/tap
brew install databricks
brew install --cask snowflake-snowsql
curl -s https://raw.githubusercontent.com/dbt-labs/dbt-core-snapshots/main/install_bundle.sh | bash -s -- 1.6.3 3.9 mac
brew install awscli


