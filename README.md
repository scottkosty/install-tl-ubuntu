# install-tl-ubuntu

## Usage

```s
sudo ./install-tl-ubuntu [OPTIONS]
```

## Features

- installs **TeX Live 2013**
  - automatically finds the fastest repository
  - gives updated progress of the install
  - restarts automatically if install fails
- tlmgr can then be used to key your install up-to-date
- notifies apt so that apt does not try to install the Ubuntu `texlive-*` packages as dependencies (e.g. if you do `sudo apt-get install lyx`)
- links to the folder where Ubuntu installs TeX files so that when you install Ubuntu packages (e.g. **FoilTeX** and **noweb**) with LaTeX files, they will be available
- adds TeX Live fonts to be used system-wide
- other font-related conveniences
  - tells AppArmor to allow Evince to access the TeX Live fonts
  - can install TrueType fonts that user provides (--truetype-dir)
  - can install IvriTeX Hebrew fonts (--hebrew)
- optionally installs additional LaTeX files for common journals that are not included in TeX Live 2013 (--more-tex)
- works non-interactively and thus can be added to a batch install script
- tlmgr can be run from the desktop menu (if 'gksu' package is installed)
- install can be done from an ISO file (--iso)

For more details, see
```s
./install-tl-ubuntu --help
```

## Description

This script uses the TeX Live 2013 installer to install TeX Live so that LaTeX packages can be updated through CTAN with **tlmgr**. To do this, the official TeX Live 2013 installer is downloaded and used and apt is informed that TeX dependencies are satisfied. Thus, when you want to install a program with apt-get that depends on TeX Live, apt will not try to install the TeX Live packages from the Ubuntu repositories.

This script automates many of the instructions that were posted in the 25 Jan 2013 answer by Silex [here](http://tex.stackexchange.com/questions/1092/how-to-install-vanilla-texlive-on-debian-or-ubuntu). TeX Live installation documentation can be found in the [Quick install](http://www.tug.org/texlive/quickinstall.html) and the [The TeX Live Guide](http://www.tug.org/texlive/doc/texlive-en/texlive-en.html#installation). Information on TeX Live's install script arguments is [here](http://www.tug.org/texlive/doc/install-tl.html). The `Net::LWP Perl module` (Ubuntu package `libwww-perl`) is recommended, but not necessary. See the "persistent-downloads" section of the install-tl documenation.

Progress and profiling are logged to `STDOUT`. Important errors are logged to `STDERR`. Annoying `STDOUT` and `STDERR` messages are redirected to a file descriptor (which is connected to the file `install-tl-ubuntu_EXTRAS.log` by default) in case they are useful for debugging.

Ubuntu versions 12.04 and later are supported.
