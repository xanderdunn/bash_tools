# macOS Settings
- Check for system update
- Enable Lockdown Mode in Settings and reboot
- Set Caps Lock key to Esc
- Enable Night Shift and max out the warmth
- Set key repeat wait to min and key repeat rate to max
- Open FaceTime and Messages and sign out of both
- Open Notifications in Settings and turn off everything
- Sign into Google account and sync only Contacts
    - Open Contacts and make the correct card your card, delete the placeholder
- Settings -> Network -> Firewall, turn it on
- Security and Privacy -> Apple advertising -> Turn off personalized ads, make sure File Vault is on
- Open Notes app to start syncing iCloud notes

# In Terminal.app, setup iTerm
- Install Homebrew: `/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"`
- `sudo vim /etc/shell` and add the line at the end `/opt/homebrew/bin/bash`
- `chsh -s /opt/homebrew/bin/bash`
- `brew install brave-browser google-drive openssh iterm2 git node github gnupg ctags htop`
    - openssh is needed to be able to use _sk ssh keys with Yubikey to clone bash_tools
- `ln -s /Users/xander/Library/CloudStorage/GoogleDrive-xander\@xander.ai/My\ Drive/Dropbox/config/profile ~/.profile`
- Now open iTerm

# In iTerm, setup neovim
- AirDrop the _sk SSH private and public keys to your ~/.ssh/
- `export PATH=$(brew --prefix openssh)/bin:$PATH` to be able to clone bash_tools
- `git clone git@github.com:xanderdunn/bash_tools.git`
- Setup vim config
    - `mkdir ~/.config/nvim/`
    - `ln -s /Users/xander/dev/bash_tools/vimrc ~/.config/nvim/init.vim`
- `ln -s /Users/xander/Library/CloudStorage/GoogleDrive-xander\@xander.ai/My\ Drive/Dropbox/config/gitignore_global ~/.gitignore_global`
- Install vim-plug: `sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'`
- `pip3 install neovim`
- `npm install -g neovim`
- Restart nvim
- :PlugInstall
- Restart nvim
- :checkhealth

# Setup dev environment
- gnupg for signing commits
    - `mkdir ~/.gnupg`
    - Airdrop ~/.gnupg/gpg-agent.conf and ~/.gnupg/pubring.kbx to your ~/.gnpug/
    - Now open two new terminal tabs and the second one should have no warnings or errors
- git config --global user.name "Xander Dunn"
- git config --global user.email "xander@xander.ai"
- git config --global core.excludesfile ~/dev/bash_tools/gitignore_global
- git config --global core.editor "nvim"
- git config --global --add --bool push.autoSetupRemote true
- iTerm2 -> Settings -> 
    - Profiles -> Other Actions -> Import JSON Profile -> . Select the new one and set as default.
    - Profiles -> Colors -> Color Presets -> Solarized Dark
    - Open the consolas.ttf font in Google Drive/Dropbox/config/ and Install it
    - Profiles -> Text -> Font -> Consolas, then choose font-size 14
    - Now open a new iTerm tab and re-open nvim and it should have the correct colors

# Setup Python dev
- `pip3 install numpy pandas`