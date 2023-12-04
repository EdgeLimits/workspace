#!/bin/bash


OLD_ZSHRC="$HOME/.zshrc"
NEW_ZSHRC="$PWD/config/zsh/.zshrc"

if [ -e "$OLD_ZSHRC" ]; then
    BACKUP_OLD_ZSHRC="${OLD_ZSHRC}-$(date +%Y-%m-%d_%H-%M-%S)"

    echo "Found old $OLD_ZSHRC file."
    echo "Backing up to $BACKUP_OLD_ZSHRC."
    
    # mv "$OLD_ZSHRC" "$BACKUP_OLD_ZSHRC"
fi

echo "Linking ~/.zshrc to $NEW_ZSHRC."
# ln -s $PWD/config/zsh/.zshrc ~/.zshrc
