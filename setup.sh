#!/bin/bash

# Define an array of font files
FONT_FILES=(
    "setup/fonts/MesloLGS NF Bold Italic.ttf"
    "setup/fonts/MesloLGS NF Bold.ttf"
    "setup/fonts/MesloLGS NF Italic.ttf"
    "setup/fonts/MesloLGS NF Regular.ttf"
    # Add more font files as needed
)

# Set the destination directory for fonts on macOS
FONT_DESTINATION="/Library/Fonts"

# Iterate through the array of font files
for FONT_FILE in "${FONT_FILES[@]}"; do
    # Check if the font file exists
    if [ ! -f "$FONT_FILE" ]; then
        echo "Font file not found: $FONT_FILE"
    else
        # Copy the font file to the destination directory
        cp "$FONT_FILE" "$FONT_DESTINATION"
        echo "Font installed successfully: $(basename "$FONT_FILE")"
    fi
done

# Install iTerm2
brew install --cask iterm2
echo "iTerm2 installed successfully."

# Install Neovim
brew install neovim
echo "Neovim installed successfully."

# Install tmux
brew install tmux
echo "TMUX installed successfully"
