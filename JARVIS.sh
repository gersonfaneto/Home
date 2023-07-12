#!/usr/bin/env bash

# Some colors for better progress visualization.

M_NOTE="[\e[1;36mNOTE\e[0m]"
M_OK="[\e[1;32mOK\e[0m]"
M_ERROR="[\e[1;31mERROR\e[0m]"
# M_ATT="[\e[1;33mATTENTION\e[0m]"
# M_WRN="[\e[1;35mWARNING\e[0m]"
# M_ACT="[\e[1;33mACTION\e[0m]"

M_WAIT="\e[1A\e[K"

# Path to the installation log.
INST_LOG="INSTALL.log"

# List of directories to be used on the configuration linking step.
EXCLUDE=("JARVIS.sh" "INSTALL.log" "RUN.sh" "README.md" "LICENSE" "fonts")
DIRS=$(ls)

FILTERED_DIRS=$(printf "%s\n" "${DIRS[@]}" | grep -vFxf <(printf "%s\n" "${EXCLUDE[@]}"))

# List of needed packages to be installed.
packages=(
	bat
	exa
	fd
	fish
	fzf
	github-cli
	glow
	kitty
	neofetch
	vim
	neovim
	ripgrep
	starship
	stow
	tmux
	trash-cli
	zoxide
)

# Show a progress bar to the user.
display_progress() {
	while pgrep "$1" &>/dev/null; do
		echo -n "."
		sleep 2
	done

	echo -en "Done!\n"

	sleep 2
}

# Tests if a package is already installed and if not found it will attempt to install it.
install_package() {
	if yay -Q "$1" &>>/dev/null; then
		echo -e "$M_OK - $1 is already installed."
	else
		echo -en "$M_NOTE - Now installing $1 ."

		yay -S --noconfirm "$1" &>>"$INST_LOG" &

		display_progress $!

		if yay -Q "$1" &>>/dev/null; then
			echo -e "$M_WAIT$M_OK - $1 was installed."
		else
			echo -e "$M_WAIT$M_ERROR - $1 install has failed, please check the log at $INST_LOG."
			exit
		fi
	fi
}

clear

# Let the user know that we will use sudo.
cat <<EOM
$(echo -e "$M_NOTE - This script will run some commands that require sudo.")
$(echo -e "$M_NOTE - You will be prompted to enter your password when needed.")
$(echo -e "$M_NOTE - If you are worried about entering your password then you may want to review the content of the script.")
EOM

sleep 0.5

# Expect user input to confirm and continua with the script or exit.
read -rep $'[\e[1;33mACTION\e[0m] - Would you like to continue with the install [Y/n] ' REPLY

if [[ $REPLY =~ ^[Yy]$ ]] || [[ -z $REPLY ]]; then
	echo -e "$M_NOTE - Setup starting..."
else
	echo -e "$M_NOTE - This script will now exit, no changes were made to your system."
	exit
fi

# Check for package manager (YAY).
if [ ! -f /sbin/yay ]; then
	echo -en "$M_NOTE - Configuring yay..."

	git clone https://aur.archlinux.org/yay.git &>>"$INST_LOG"

	cd yay || exit

	makepkg -si --noconfirm &>>../"$INST_LOG" &

	display_progress $!

	if [ -f /sbin/yay ]; then
		echo -e "$M_WAIT$M_OK - yay configured with success."
		cd ..

		echo -en "$M_NOTE - Updating yay database."

		yay -Suy --noconfirm &>>"$INST_LOG" &

		display_progress $!

		echo -e "$M_WAIT$M_OK - yay database updated with success."
	else
		echo -e "$M_WAIT$M_ERROR - yay installation failed, please check the log at $INST_LOG!"
		exit
	fi
fi

# Install all of the packages declared in the list above.
read -rep $'[\e[1;33mACTION\e[0m] - Would you like to install the packages? [Y/n] ' REPLY

if [[ $REPLY =~ ^[Yy]$ ]] || [[ -z $REPLY ]]; then
	echo -e "$M_NOTE - Beggining installation, this may take a while..."

	for PACKAGE in "${packages[@]}"; do
		install_package "$PACKAGE"
	done
fi

# Install asdf for version management.
read -rep $'[\e[1;33mACTION\e[0m] - Would you like to install asdf? [Y/n] ' REPLY

if [[ ! -d "$HOME"/.asdf/  &&  ($REPLY =~ ^[Yy]$  ||  -z $REPLY) ]]; then
  echo -en "$M_NOTE - Beggining installation, this may take a while..."

  git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.12.0 &>>"$INST_LOG" &

  display_progress $!

  if [[ -d $HOME/.asdf/ ]]; then
    echo -e "$M_WAIT$M_OK - asdf installed completed with success!"

    mkdir -p ~/.config/fish/completions

    ln -sf ~/.asdf/completions/asdf.fish ~/.config/fish/completions 
	else
		echo -e "$M_WAIT$M_ERROR - asdf installation failed, please check the log at $INST_LOG!"
		exit
	fi
else
  echo -e "$M_NOTE - asdf is already installed!"
fi

# Link configuration files.
read -rep $'[\e[1;33mACTION\e[0m] - Would you like to link the configuration files? [Y/n] ' REPLY

if [[ $REPLY =~ ^[Yy]$ ]] || [[ -z $REPLY ]]; then
	echo -e "$M_NOTE - Linking configuration files..."

	# Setup each package configuration folder.
	for DIR in $FILTERED_DIRS; do
		stow --dotfiles --target="$HOME" "$DIR" &>>/dev/null
	done

  echo -e "$M_NOTE - Copying fonts..."

	mkdir -p "$HOME"/.local/share/fonts/ >>/dev/null

	cp -r fonts/* "$HOME"/.local/share/fonts/

  echo -e "$M_NOTE - Refreshing font cache..."

	fc-cache -f
fi

# Change the default shell to fish.
read -rep $'[\e[1;33mACTION\e[0m] - Would you like to change the default shell to fish? [Y/n] ' REPLY

if [[ $REPLY =~ ^[Yy]$ ]] || [[ -z $REPLY ]]; then
	if [ "$SHELL" != "/usr/bin/fish" ]; then
		echo -e "$M_NOTE - Changing default shell to fish..."
		chsh -s "$(which zsh)"
	else
		echo -e "$M_NOTE - Fish is already the default shell!"
	fi
fi

echo -e "$M_NOTE - Installation was finished with success!"
echo -e "$M_NOTE - You may close and reopen your terminal for changes to take full effect!"
