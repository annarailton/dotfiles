# dotfiles

Default configuration files

## Set up of fresh KDE install

- Create an ssh key (with a password): `ssh-keygen -t rsa -b 4096 -C $EMAIL`
- Add public key to GitHub
- Run `install.sh` to install basic packages
- Check `ssh-agent` is working with `ssh -T git@github.com`
- Run `install-post-reboot.sh`

## Stuff to "fix" a Mac

- Windowing, use [Magnet](https://magnet.crowdcafe.com/)
- Keep screenshots off the desktop: `defaults write com.apple.screencapture location ~/Pictures`
- Install [Alfred 4](https://www.alfredapp.com/) (license via GH Gear)
- 

### Mouse

- Middle mouse button copy-paste: https://github.com/lodestone/macpaste
- `System Preferences > Mouse` - uncheck `Scroll direction: Natural`

### Keyboard

- `Keyboard > Input sources > British - PC`
- Home and End keys: add the following to `~/Library/KeyBindings/DefaultKeyBinding.dict`:
```
{
  "\UF729"  = moveToBeginningOfParagraph:; // home
  "\UF72B"  = moveToEndOfParagraph:; // end
  "$\UF729" = moveToBeginningOfLineAndModifySelection:; // shift-home
  "$\UF72B" = moveToEndOfLineAndModifySelection:; // shift-end
}
```
- To make this work on terminal (see [this link](https://apple.stackexchange.com/a/114528)) for more details
    - `Terminal > Preferences > Profiles > Keyboard`
    - Modify/add keys to `send string to shell`: 
        1. `home`: `\001` (access via `Ctrl+A`)
        2. `end`: `\005` (access via `Ctrl+E`)
- [BetterTouchTool](https://folivora.ai/) to setup keyboard shortcuts
- [F5 Chrome page refresh](https://www.maciverse.com/make-f5-refresh-the-browser-on-a-mac.html)

### Stuff to install 

(Will become a script at some point)
```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

brew install gh
brew install pyenv
brew install pyenv-virtualenv
brew update && brew install azure-cli
```

### `pyenv` + `zsh` + SublimeLinter

Following [this blogpost](https://thoughtstreams.io/paltman/getting-sublimelinter-to-work-with-pyenv-and-zsh/) I got both `pylint` and `mypy` to work via changing the `path` setting in the `SublimeLinter` settings:

```json
// SublimeLinter Settings - User
{
    "paths": {
        "linux": ["/usr/local/bin/pylint", "/usr/bin/javac", "/usr/local/bin/mdl", "/usr/local/bin/shellcheck", "/usr/local/bin/yamllint"],
        "osx": ["/usr/local/Cellar/pyenv/1.2.24.1/bin"],
        "windows": []
    }
}
````
I also made sure that `pylint` and `mypy` where `pip` installed from the base `pyenv` python. 
