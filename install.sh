#!/bin/bash
# Install required packages for banner-and-fetch.sh

if command -v brew &> /dev/null; then
    echo "Installing figlet with Homebrew..."
    brew install figlet
elif command -v apt-get &> /dev/null; then
    echo "Installing figlet with apt-get..."
    sudo apt-get update
    sudo apt-get install -y figlet
else
    echo "Please install 'figlet' manually for your system."
fi
