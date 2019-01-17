#!/bin/sh
# (c) sometime justinas@eofnet.lt
# If you want to install additional software please add it to packages.txt file, one per line
# 

detectXcodeTools() {
echo "Detecting if xcode tools are installed..."
if ! [ -x "$(command -v git)" ]; then
echo "Xcode tools does not installed, installing them..."
xcode-select --install
else
echo "Xcode tools already installed on the system!"
fi 
}

detectBrew() {
echo "Detecting if brew package manager is installed..."
if ! [ -x "$(command -v brew)" ]; then
echo "Brew does not installed, installing..."
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
echo "Brew installed!"
else
echo "Brew is already installed!"
fi
}

upgradeBash() {
echo "Detecting if bash is installed/upgraded from ports..."
if ! [ -x "$(command -v /usr/local/bin/bash)" ]; then
echo "Bash upgrade is needed..."
brew install bash
echo "Please enter your password for permission to change the bash to the newer version!"
chsh -s /usr/local/bin/bash
else
echo "Bash is already up to date!"
fi
}

installSoft() {
if [ -e "packages.txt" ]; then
echo "You are about to install software that are specified in packages.txt file, are you ready ? (y,n)"
read answer
if [ "$answer" == "y" ]; then
while read -r package; do
    if ! [ -x "$(command -v $package)" ]; then
    echo "Package $package does not installed in your system!"
    brew install $package
    fi
done < packages.txt
else
echo "Software installation was cancelled!"
fi
fi
}

updateProfile() {
if [ -e "$HOME/.bash_profile" ]; then
echo "We are about to override .bash_profile settings, but it seems that you have it already, continue to overwrite file ? (y,n)"
read answer
else
answer="y"
fi
if [ "$answer" == "y" ]; then
echo "Overwriting the .bash_profile file..."
cp -f .bash_profile $HOME/.bash_profile
echo "Done setting up the bash, you need to restart the terminal for settings to take effect!"
else
echo "You have canceled the .bash_profile override..."
fi
}

detectXcodeTools
detectBrew
upgradeBash
installSoft
updateProfile
echo "All done"
