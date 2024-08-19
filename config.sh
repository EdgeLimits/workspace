#!/bin/bash


# ~/.zshrc linking

ZSHRC_TARGET="$HOME/.zshrc"
ZSHRC_SOURCE="$PWD/config/zsh/.zshrc"

if [ -e "$ZSHRC_TARGET" ]; then
    BACKUP_ZSHRC_TARGET="${ZSHRC_TARGET}($(date +%Y-%m-%d_%H-%M-%S))"

    echo "Found old $ZSHRC_TARGET file."
    echo "Backing up to $BACKUP_ZSHRC_TARGET."
    
    mv "$ZSHRC_TARGET" "$BACKUP_ZSHRC_TARGET"
elif [ -L "$ZSHRC_TARGET" ]; then
    echo "Found old symbolic link at $ZSHRC_TARGET."
    echo "Removing symbolic link."
    
    rm "$ZSHRC_TARGET"
fi

ln -s $PWD/config/zsh/.zshrc ~/.zshrc
echo "Symbolic link created ~/.zshrc to $ZSHRC_SOURCE."


VIM_TARGET="$HOME/.vimrc"
VIM_SOURCE="$PWD/config/nvim/vimrc.vim"

if [ -e "$VIM_TARGET" ]; then
    BACKUP_OLD_VIM="${VIM_TARGET}($(date +%Y-%m-%d_%H-%M-%S))"

    echo "Found old $VIM_TARGET."
    echo "Backing up to $BACKUP_OLD_VIM."
    
    mv "$VIM_TARGET" "$BACKUP_OLD_VIM"
elif [ -L "$VIM_TARGET" ]; then
    echo "Found old symbolic link at $VIM_TARGET."
    echo "Removing symbolic link."
    
    rm "$VIM_TARGET"
fi

ln -s "$VIM_SOURCE" "$VIM_TARGET"
echo "Symbolic link created: $VIM_SOURCE -> $VIM_TARGET"

NVIM_TARGET="$HOME/.config/nvim"
NVIM_SOURCE="$PWD/config/nvim"

if [ -e "$NVIM_TARGET" ]; then
    BACKUP_OLD_NVIM="${NVIM_TARGET}($(date +%Y-%m-%d_%H-%M-%S))"

    echo "Found old $NVIM_TARGET."
    echo "Backing up to $BACKUP_OLD_NVIM."
    
    mv "$NVIM_TARGET" "$BACKUP_OLD_NVIM"
elif [ -L "$NVIM_TARGET" ]; then
    echo "Found old symbolic link at $NVIM_TARGET."
    echo "Removing symbolic link."
    
    rm "$NVIM_TARGET"
fi

ln -s "$NVIM_SOURCE" "$NVIM_TARGET"
echo "Symbolic link created: $NVIM_SOURCE -> $NVIM_TARGET"

TMUX_TARGET="$HOME/.tmux.conf"
TMUX_SOURCE="$PWD/config/tmux/.tmux.conf"

if [ -e "$TMUX_TARGET" ]; then
    BACKUP_OLD_TMUX="${TMUX_TARGET}($(date +%Y-%m-%d_%H-%M-%S))"

    echo "Found old $TMUX_TARGET."
    echo "Backing up to $BACKUP_OLD_TMUX."
    
    mv "$TMUX_TARGET" "$BACKUP_OLD_TMUX"
elif [ -L "$TUMUX_TARGET" ]; then
    echo "Found old symbolic link at $TMUX_TARGET."
    echo "Removing symbolic link."
    
    rm "$TMUX_TARGET"
fi

ln -s "$TMUX_SOURCE" "$TMUX_TARGET"
echo "Symbolic link created: $TMUX_SOURCE -> $TMUX_TARGET"

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
# run <leader>I to install tmux packages

WEZTERM_TARGET="$HOME/.config/wezterm"
WEZTERM_SOURCE="$PWD/config/wezterm"

ln -s "$WEZTERM_SOURCE" "$WEZTERM_TARGET"
echo "Symbolic link created: $WEZTERM_SOURCE -> $WEZTERM_TARGET"

STARSHIP_TARGET="$HOME/.config/starship.toml"
STARSHIP_SOURCE="$PWD/config/starship/starship.toml"

ln -s "$STARSHIP_SOURCE" "$STARSHIP_TARGET"
echo "Symbolic link created: $STARSHIP_SOURCE -> $STARSHIP_TARGET"

source "$ZSHRC_TARGET"
