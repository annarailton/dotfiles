# Basic packages
sudo apt update
sudo apt install git curl apt-transport-https
sudo snap install keepassxc
sudo apt install undistract-me
sudo snap install slack --classic
sudo apt install fonts-firacode
sudo apt-get install insync
sudo apt-get install ktouch
sudo apt install python3-virtualenv python3-pip

# Get dotfiles
mkdir admin
git clone git@github.com:annarailton/dotfiles.git admin/dotfiles
cd dotfiles
./create_symlinks.sh

# Set up ssh-agent service
systemctl --user enable ssh-agent
systemctl --user start ssh-agent

# Google Chrome
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo apt install ./google-chrome-stable_current_amd64.deb

# Install Zoom
wget https://zoom.us/client/latest/zoom_amd64.deb
sudo apt install ./zoom_amd64.deb

# Install Sublime text and grab settings from GitHub
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
echo "deb https://download.sublimetext.com/ apt/dev/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
sudo apt-get update
sudo apt-get install sublime-text
git clone git@github.com:annarailton/sublime-settings.git ~/.config/sublime-text-3/Packages/User

# Install docker
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh
sudo usermod -aG docker $USER

# Get work passwords (attach to Keepass install)
git clone git@github.com:annarailton/work-passwords.git admin/work-passwords

# Install some linters
python3 -m pip install pylint yapf yamllint mypy
sudo apt-get install shellcheck

# Cleanup
sudo apt autoremove