# EdgeLimits' Workspace

This repository contains various "dotfiles" for my personal development needs.

## 0.
* git
* brew


```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

Add Homebrew To Path
After installing, add it to the path (replace ”[username]” with your actual username):

```
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /Users/[username]/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"
```



## 1. 

```
git submodule init
git submodule update --recursive
```

```
chmod +x setup.sh config.sh
```

```
./setup.sh
```

```
./config.sh
```


NVIM formatting:

https://www.youtube.com/watch?v=ybUE4D80XSk


https://github.com/Jarmos-san/dotfiles/blob/ab2aaaebf56c1bb0da8a9a36a0bc41675597142a/dotfiles/.config/nvim/lua/keymaps.lua


## 2.

Keybindings
TMUX

<leader>: Ctrl + Space
Split panes vertically: <leader> -
Split panes horizontally: <leader> |

Reload tmux config: <leader> r
```
defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false              # For VS Code
defaults write com.microsoft.VSCodeInsiders ApplePressAndHoldEnabled -bool false      # For VS Code Insider
defaults write com.vscodium ApplePressAndHoldEnabled -bool false                      # For VS Codium
defaults write com.microsoft.VSCodeExploration ApplePressAndHoldEnabled -bool false   # For VS Codium Exploration users
defaults delete -g ApplePressAndHoldEnabled
```
