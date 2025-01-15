# macOS Settings
- Check for system update
- Enable Lockdown Mode in Settings and reboot
- Set keyboard shortcut Spotlight to Control + Space
- Set Caps Lock key to Esc
- Set bottom right hot corner to Mission Control
- Set Dock to left side and auto hide
- Settings -> Desktop and Dock -> Mission Control -> disable Automatically rearrange Spaces
- Enable Night Shift and max out the warmth
- Set key repeat wait to min and key repeat rate to max
- Open FaceTime and Messages and sign out of both
- Open Notifications in Settings and turn off everything
- Sign into Google account and sync only Contacts
    - Open Contacts and make the correct card your card, delete the placeholder
- Settings -> Network -> Firewall, turn it on
- Security and Privacy -> Apple advertising -> Turn off personalized ads, make sure File Vault is on
- Open Notes app to start syncing iCloud notes
- Settings -> Lock Screen -> Require password after screen saver begins -> Immediately
- In TextEdit, set the default to open a plain text document rather than rich text
- In Notes, set the default new note to start with Body rather than Title
- Turn on Private Relay
- Add extensions to Brave
    - [Distraction Free YouTube](https://chrome.google.com/webstore/detail/df-tube-distraction-free/mjdepdfccjgcndkmemponafgioodelna?hl=en)
    - [Markdown Here](https://chrome.google.com/webstore/detail/markdown-here/elifhakcjgalahccnjkneoccemfahfoa?hl=en)

# In Terminal.app, setup iTerm
- Install Homebrew: `/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"`
- Setup bash as the default shell
    - `brew install bash`
    - `sudo vim /etc/shells` and add the line at the end `/opt/homebrew/bin/bash`
    - `chsh -s /opt/homebrew/bin/bash`
- `brew install newovim brave-browser google-drive openssh iterm2 git node github gnupg htop pinentry-mac pwgen the_silver_searcher bash-completion font-hack-nerd-font`
    - openssh is needed to be able to use _sk ssh keys with Yubikey to clone bash_tools
- `ln -s /Users/xander/Library/CloudStorage/GoogleDrive-xander\@xander.ai/My\ Drive/Dropbox/config/profile ~/.profile`
- Now open iTerm
- Load the file `/Users/xander/Library/CloudStorage/GoogleDrive-xander\@xander.ai/My\ Drive/Dropbox/config/iterm_profile_visible_selection.json` into iTerm profiles and set it as the default

# In iTerm, setup neovim
- AirDrop the _sk SSH private and public keys to your ~/.ssh/
- `export PATH=$(brew --prefix openssh)/bin:$PATH` to be able to clone bash_tools
- `git clone git@github.com:xanderdunn/bash_tools.git`
- Setup vim config
    - `mkdir ~/.config/nvim/`
    - `ln -s ~/dev/bash_tools/vimrc ~/.config/nvim/init.vim`
    - `mkdir ~/.config/nvim/lua
    - `ln -s ~/dev/bash_tools/config.lua ~/.config/nvim/lua/config.lua`
- `ln -s /Users/xander/Library/CloudStorage/GoogleDrive-xander\@xander.ai/My\ Drive/Dropbox/config/gitignore_global ~/.gitignore_global`
- `npm install -g neovim`
- `npm -g install cspell`
- `brew install stylua`
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
- git config --global commit.gpgsign true
- You should now be able to GPG sign: `echo "test" | gpg --clearsign`
    - Debug GPG signing [here](https://drive.google.com/drive/u/0/search?q=yubieky)
- iTerm2 -> Settings ->
    - Profiles -> Other Actions -> Import JSON Profile -> . Select the new one and set as default.
    - Profiles -> Colors -> Color Presets -> Solarized Dark
    - Open the consolas.ttf font in Google Drive/Dropbox/config/ and Install it
    - Profiles -> Text -> Font -> Consolas, then choose font-size 14
    - Now open a new iTerm tab and re-open nvim and it should have the correct colors

# Setup Python dev
- python3 -m venv ~/.config/py_env
- Add to ~/.profile: `source ~/.config/py_env/bin/activate`
- pip3 install pynvim numpy pandas

# Setup SSH key in the macOS Agent
This will allow you to enter the SSH passcode once and then have it cached for the rest of the session.
- `eval "$(ssh-agent -s)"`
- nvim ~/.ssh/config:
    ```
    Host github.com
      AddKeysToAgent yes
      UseKeychain yes
      IdentityFile ~/.ssh/id_ed25519
    ```
- `ssh-add --apple-use-keychain ~/.ssh/id_ed25519`
