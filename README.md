# `herr_doktor_frankenmac` README.md
Copyright: Joseph J. Radler, 2019
---

## Development Notes
The scope of this system configuration is currently restricted to setting up my
personal MacOS Mojave machines for software development and scientific computing.
If you like my sense of aesthetics, please feel free to set your system up using
my defaults, but the main idea of this is to allow you to quickly and easily
configure the various aspects of the system in a reproducible way to suit your
specific needs and aesthetic tastes.

#### Some Acknowledgements Upfront
It took me a while to cobble together the pieces of this configuration, and I do
not deserve the credit for developing anything in this suite except the design
and installers. Everything else was built and is maintained by a veritable horde
of open-source developers around the world. I owe them my gratitude.

#### Notes on Configuration
However, getting these packages to play nice with MacOS Mojave -- and with each
other -- has taken me some time. Because of this, the global confuguration files
are the only things that should need modifying at this point. My scripts will
modify the relevant configuration files in the proper formats to accomplish
what you want the end product to be.

The system configuration lists are set up such that commenting out lines in the
program and application lists will not cause those applications to be installed
nor will they be setup or configured.

#### PATH environment variable
The PATH variable is held in memory during setup and added to the configuration
dotfiles for the various shells available on the machine.

#### Core Dependencies and Automation
There are a few core dependencies that will be needed, but they are handled in
the appropriate order by the `initial_setup.sh` script, which is invoked by
running `setup_mojave.sh`.

## Configuring packages and package manager credentials
There are a few inputs needed to set up things like GitHub and git credentials,
ssh and scp known hosts and configurations.  These may be entered by you manually
in the `credentials` textfile. They are set up to be ignored by git in the
`.gitignore-global` file so should you decide to fork and modify this repo, your
keys, hosts, and credentials will not be accidentally posted on your version
control remote repository for public viewing!

