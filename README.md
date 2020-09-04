# dotfiles

Default configuration files

## Set up of fresh KDE install 

- Create an ssh key (with a password): `ssh-keygen -t rsa -b 4096 -C $EMAIL`
- Add public key to GitHub
- Run `install.sh` to install basic packages
- Check `ssh-agent` is working with `ssh -T git@github.com`
- Run `install-post-reboot.sh`
