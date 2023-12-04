#!/bin/bash


OLD_ZSHRC="$HOME/.zshrc"
NEW_ZSHRC="$PWD/config/zsh/.zshrc"

if [ -e "$OLD_ZSHRC" ]; then
    BACKUP_OLD_ZSHRC="${OLD_ZSHRC}-$(date +%Y-%m-%d_%H-%M-%S)"

    echo "Found old $OLD_ZSHRC file."
    echo "Backing up to $BACKUP_OLD_ZSHRC."
    
    # mv "$OLD_ZSHRC" "$BACKUP_OLD_ZSHRC"
fi

# ln -s $PWD/config/zsh/.zshrc ~/.zshrc
echo "Symbolic link created ~/.zshrc to $NEW_ZSHRC."

SOURCE_THEME_LOCATION="$PWD/setup/powerlevel10k"
DESTINATION_THEME_LOCATION="$PWD/setup/ohmyzsh/custom/themes/powerlevel10k"

chmod 755 "$SOURCE_THEME_LOCATION"

# Check if the destination directory exists
if [ -d "$DESTINATION_THEME_LOCATION" ]; then
    # If it exists, remove the existing symbolic link
    if [ -L "$DESTINATION_THEME_LOCATION" ]; then
        echo "Removing existing symbolic link at: $DESTINATION_THEME_LOCATION"
        rm "$DESTINATION_THEME_LOCATION"
    else
        echo "Destination is not a symbolic link: $DESTINATION_THEME_LOCATION"
        # Handle this case as needed
    fi
fi
# Create a new symbolic link
ln -s "$SOURCE_THEME_LOCATION" "$DESTINATION_THEME_LOCATION"
echo "Symbolic link created: $DESTINATION_THEME_LOCATION -> $SOURCE_THEME_LOCATION"
