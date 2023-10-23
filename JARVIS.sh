#!/usr/bin/env bash

# WARNING: This script is currently broken, packages will fail to install...

# Some colors for better progress visualization.
NOTE="[\e[1;36mNOTE\e[0m]"
OK="[\e[1;32mOK\e[0m]"
ERROR="[\e[1;31mERROR\e[0m]"
# ATTENTION="[\e[1;33mATTENTION\e[0m]"
# WARNING="[\e[1;35mWARNING\e[0m]"
# ACTION="[\e[1;33mACTION\e[0m]"

WAIT="\e[1A\e[K"

# Path to the installation log.
LOG="INSTALL.log"

# List of directories to be excluded/used on the configuration linking step.
EXCLUDE=("JARVIS.sh" "INSTALL.log" "README.md" "LICENSE" "fonts")
DIRS=$(ls)

FILTERED_DIRS=$(printf "%s\n" "${DIRS[@]}" | grep -vFxf <(printf "%s\n" "${EXCLUDE[@]}"))

# List of needed packages to be installed.
packages=(
	bat
	bottom
  difft
	eza
	fd
	fish
	fzf
	git
	github-cli
	glow
  jq
	kitty
	lf
  mediainfo
	neofetch
	neovim
  python-pdftotext
	ripgrep
	starship
	stow
  tar
	tmux
	trash-cli
  unzip
	vimv
  xh
  zip
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
		echo -e "$OK - $1 is already installed."
	else
		echo -en "$NOTE - Now installing $1 ."

		yay -S --noconfirm "$1" &>>"$LOG" &

		display_progress $!

		if yay -Q "$1" &>>/dev/null; then
			echo -e "$WAIT$OK - $1 was installed."
		else
			echo -e "$WAIT$ERROR - $1 install has failed, please check the log at $LOG."
			exit
		fi
	fi
}

clear

# Let the user know that we will use sudo.
echo -e "$NOTE - This script will run some commands that require sudo."
echo -e "$NOTE - You will be prompted to enter your password when needed."
echo -e "$NOTE - If you are worried about entering your password then you may want to review the content of the script."

sleep 1

# Expect user input to confirm and continua with the script or exit.
read -rep $'[\e[1;33mACTION\e[0m] - Would you like to continue with the install [Y/n] ' REPLY

if [[ $REPLY =~ ^[Yy]$ ]] || [[ -z $REPLY ]]; then
	echo -e "$NOTE - Setup starting..."
else
	echo -e "$NOTE - This script will now exit, no changes were made to your system."
	exit
fi

# Check for package manager (YAY).
if [ ! -f /sbin/yay ]; then
	echo -en "$NOTE - Configuring yay..."

	git clone https://aur.archlinux.org/yay.git &>>"$LOG"

	cd yay || exit

	makepkg -si --noconfirm &>>../"$LOG" &

	display_progress $!

	if [ -f /sbin/yay ]; then
		echo -e "$WAIT$OK - yay configured with success."
		cd ..

		echo -en "$NOTE - Updating yay database."

		yay -Suy --noconfirm &>>"$LOG" &

		display_progress $!

		echo -e "$WAIT$OK - yay database updated with success."
	else
		echo -e "$WAIT$ERROR - yay installation failed, please check the log at $LOG!"
		exit
	fi
fi

# Install all of the packages declared in the list above.
read -rep $'[\e[1;33mACTION\e[0m] - Would you like to install the packages? [Y/n] ' REPLY

if [[ $REPLY =~ ^[Yy]$ ]] || [[ -z $REPLY ]]; then
	echo -e "$NOTE - Beggining installation, this may take a while..."

	for PACKAGE in "${packages[@]}"; do
		install_package "$PACKAGE"
	done
fi

# Install asdf for version management.
read -rep $'[\e[1;33mACTION\e[0m] - Would you like to install asdf? [Y/n] ' REPLY

if [[ -d "$HOME"/.asdf/ ]]; then
	echo -e "$NOTE - asdf is already installed!"
elif [[ $REPLY =~ ^[Yy]$ || -z $REPLY ]]; then
	echo -en "$NOTE - Beggining installation, this may take a while..."

	git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.12.0 &>>"$LOG" &

	display_progress $!

	if [[ -d $HOME/.asdf/ ]]; then
		echo -e "$WAIT$OK - asdf installed completed with success!"

		mkdir -p ~/.config/fish/completions

		ln -sf ~/.asdf/completions/asdf.fish ~/.config/fish/completions
	else
		echo -e "$WAIT$ERROR - asdf installation failed, please check the log at $INST_LOG!"
		exit
	fi
fi

# Link configuration files.
read -rep $'[\e[1;33mACTION\e[0m] - Would you like to link the configuration files? [Y/n] ' REPLY

if [[ $REPLY =~ ^[Yy]$ ]] || [[ -z $REPLY ]]; then
	echo -e "$NOTE - Linking configuration files..."

	# Setup each package configuration folder.
	for DIR in $FILTERED_DIRS; do
		stow --dotfiles --target="$HOME" "$DIR" &>>/dev/null
	done

	echo -e "$NOTE - Copying fonts..."

	mkdir -p "$HOME"/.local/share/fonts/ >>/dev/null

	stow --dotfiles --target="$HOME" fonts &>>/dev/null

	echo -e "$NOTE - Refreshing font cache..."

	fc-cache -f

	echo -e "$NOTE - Generating extra configurations for kitty..."

  "$HOME"/.config/kitty/scripts/generate-fonts.sh

	echo -e "$NOTE - Updating git submodules..."

	git submodule update --init

	if yay -Q bat &>>/dev/null; then
		echo -e "$NOTE - Updating 'bat' themes..."
		bat cache --build &>>/dev/null
	fi
fi

# Change the default shell to fish.
read -rep $'[\e[1;33mACTION\e[0m] - Would you like to change the default shell to fish? [Y/n] ' REPLY

if [[ $REPLY =~ ^[Yy]$ ]] || [[ -z $REPLY ]]; then
	if [ "$SHELL" != "/usr/bin/fish" ]; then
		echo -e "$M_NOTE - Changing default shell to fish..."
		chsh -s "$(which zsh)"
	else
		echo -e "$NOTE - Fish is already the default shell!"
	fi
fi

clear

echo -e "$NOTE - Installation was finished with success!"
echo -e "$NOTE - You may close and reopen your terminal for changes to take full effect!"

sleep 1
