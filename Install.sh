#!/bin/sh
echo "Time for some updates..."
brew update
brew install bash gnuls
echo "Please enter your password for permission to change the bash to the newer version!"
chsh -s /usr/local/bin/bash
