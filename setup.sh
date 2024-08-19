#!/bin/bash

# Define an array of font files
FONT_FILES=(
    "fonts/MesloLGS NF Bold Italic.ttf"
    "fonts/MesloLGS NF Bold.ttf"
    "fonts/MesloLGS NF Italic.ttf"
    "fonts/MesloLGS NF Regular.ttf"
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

# Install Neovim
brew install neovim
echo "Neovim installed successfully."

# Install tmux
brew install tmux
echo "TMUX installed successfully"

# Install ripgrep (NVIM telescope dependency) 
brew install ripgrep
echo "Ripgrep installed successfully"

# Install lazygit
brew install lazygit
echo "Lazygit installed successfully"

# Install WezTerm
brew install --cask wezterm
echo "Wezterm installed successfully"

# Install Starship
brew install starship
echo "Starship installed successfully"

# Install zsh-highlight & zsh-autosuggestions
brew install zsh-syntax-highlighting zsh-autosuggestions
echo "Syntax Highlighting & Autosuggestions installed successfully"

