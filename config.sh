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


# powerlevel10k theme linking

SOURCE_THEME_LOCATION="$PWD/setup/powerlevel10k"
DESTINATION_THEME_LOCATION="$PWD/setup/ohmyzsh/custom/themes/powerlevel10k"

chmod 755 "$SOURCE_THEME_LOCATION"

# Check if the destination directory exists
if [ -d "$DESTINATION_THEME_LOCATION" ]; then
    # If it exists, remove the existing symbolic link
    if [ -L "$DESTINATION_THEME_LOCATION" ]; then
        echo "Removing existing symbolic link at: $DESTINATION_THEME_LOCATION"
        rm "$DESTINATION_THEME_LOCATION"
    fi
fi
# Create a new symbolic link
ln -s "$SOURCE_THEME_LOCATION" "$DESTINATION_THEME_LOCATION"
echo "Symbolic link created: $DESTINATION_THEME_LOCATION -> $SOURCE_THEME_LOCATION"



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

# Create a new symbolic link
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
