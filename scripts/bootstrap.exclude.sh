#!/bin/sh

# Initialize a few things
init () {
	echo "Making a Development folder in $PATH_TO_DEV if it doesn't already exist"
	mkdir -p "$PATH_TO_DEV"
	echo "Making a Playground folder in $PATH_TO_PLAYGROUND if it doesn't already exist"
	mkdir -p "$PATH_TO_PLAYGROUND"
}

# TODO : Delete symlinks to deleted files
# Is this where rsync shines?
# TODO - add support for -f and --force
link () {
	echo "This utility will symlink the files in this repo to the home directory"
	echo "Proceed? [y/n]"
	read resp
	if [ "$resp" = 'y' -o "$resp" = 'Y' ] ; then
		for file in $( ls -A | grep -vE '\.exclude*|\.git|\.gitignore|.*.md' ) ; do
			file = ".$file"
			ln -sv "$PWD/$file" "$HOME/$file"
		done

		echo "Symlinking complete"
		echo "Source the linked dotfiles [y/n]?"
		read resp

		if [ "$resp" = 'y' -o "$resp" = 'Y' ] ; then
			echo "Sourcing the .profile file in $HOME..."
			. $HOME/.profile
		else
			echo "Sourcing must be completed by the User at a later time!"
		fi
	else
		echo "Symlinking cancelled by user"
		return 1
	fi
}

install_tools () {
	# if [ $( echo "$OSTYPE" | grep 'darwin' ) ] ; then
	# 	echo "This utility will install useful utilities using Homebrew"
	# 	echo "Proceed? (y/n)"
	# 	read resp
	# 	# TODO - regex here?
	# 	if [ "$resp" = 'y' -o "$resp" = 'Y' ] ; then
	# 		echo "Installing useful stuff using brew. This may take a while..."
	# 		sh brew.exclude.sh
	# 	else
	# 		echo "Brew installation cancelled by user"
	# 	fi
	# else
	# 	echo "Skipping installations using Homebrew because MacOS was not detected..."
	# fi

	case "$OSTYPE" in
		solaris*) 	echo "This is a Solaris machine, it should have what we need..." ;;
					#TODO: Install GNU CoreUtils, clang, gcc, nvim, Julia, and Perl on Solaris?
					# solarisinstall.exclude.sh
		darwin*)	echo "This is a MacOS machine:  Install Homebrew [y/n]?"
					read resp
					if [ "$resp" = 'y' -o "$resp" = 'Y' ]; then
						echo "Installing useful stuff using brew -- get some coffee, this might be awhile..."
						sh brew.exclude.sh
					else
						echo "Homebrew installation cancelled by the User!"
					fi ;;
		gnu*)		echo "This is a Linux machine which might still need Linuxbrew!"
					echo "Install Linuxbrew [y/n]?"
					read resp
					if [ "$resp" = 'y' -o "$resp" = 'Y' ]; then
						echo "Installing useful stuff using Linuxbrew -- get some coffee, this might be awhile..."
						sh linuxbrew.exclude.sh
					else
						echo "Linuxbrew installation cancelled by the User!"
					fi ;;
		bsd*)		echo "This is a BSD machine. I don't know what to do with this yet..." ;;
					#TODO: figure out what tools and configurations I would want on BSD.
		*)			echo "Unknown operating system:  $OSTYPE" ;;
	esac
}

link () {

}

init
link
install_tools<Paste>
