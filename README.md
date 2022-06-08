![alt text](https://raw.githubusercontent.com/everest-linux/amogus3016/main/glacierlogo.png)

# Glacier
Glacier is the package manager developed for Everest Linux. It fetches packages from https://github.com/everest-linux/glacier-pkgs

Install Glacier by pasting the following command into your terminal:
```
rm -rf /tmp/glacier && cd /tmp && git clone https://github.com/everest-linux/glacier &&
cd glacier/install && chmod +x INSTALL-GLACIER.sh && sudo ./INSTALL-GLACIER.sh || doas ./INSTALL-GLACIER.sh
```
For Glacier to work properly, you need to have both wget and tar installed.

Glacier depends on wget and tar for its backends. It also requires a working C compiler for source packages to work correctly. Some packages may have their own sets of dependencies. All of these are configured by default in the Everest rootfs tarball, but you may need some extra configuration to get these programs on other distros, most notably, Arch and its derivatives.

Glacier is intended to be a universal package manager, and should work on all distros, providing you have wget and tar installed. For the sake of compatibility, all scripts submitted should contain **NON DISTRO SPECIFIC COMMANDS**.

Glacier features both apt-like and pacman-like syntax (`glacier install` or `glacier -f`)

# Submitting Packages

Packages should be submitted by sending a pull request to https://github.com/everest-linux/glacier-pkgs, with your package in the proper testing repository (if its system software, world-testing, if its gpl software, galaxy-testing, etc). A maintainer will test the package to make sure it downloads correctly.
  
# Latest News

6/8/22 > Basic package integrity checking. 2.1

5/31/22 > Added command line parsing and condensed Glacier into a single script. 2.0

5/27/22 > Happy Memorial Day to everyone in the US. I've added a new file, `/etc/glacier/hooks.sh` that will define startup hooks when any Glacier script is run. It is highly recommended to keep both default hooks, and to create `/etc/make.conf`. 1.3

5/17/22 > Considering adding command line parsing

5/3/22 > Multi repository support is back! 1.2

5/3/22 > Multi-repository support might return, as I've discovered "||". 1.1 (only minor changes, such as line printing)

4/20/22 > Colored output, and proper unicode symbols. First stable Glacier release, 1.0

4/13/22 > Multi-repository support has been temporarily removed, due to incorrect error handling. 0.7.5rc

4/12/22 > Added support for multiple repositories (world, galaxy, universe, multiverse, and their testing counterparts).
 
 4/5/22 > Added package timestamps. New package uploads will be halted until all current packages have timestamp capabilities added. To do this, add a script called (package_name).ts.sh, which should contain 2 commands:
 ```
 touch /var/log/glacier/(package_name).timestamp
 date >> /var/log/glacier/(package_name).timestamp
 ```
 0.6rc.
 
 3/28/22 (again) > Added package caching. This is useful if the user wishes to customize package instruction scripts before installing. 0.5rc
 
 3/28/22 > Recovered from sickness, released 0.4rc. This update provides proper cleanup after an operation is complete. This is done by making a temporary directory that the tarball will be unpacked into. Also added the logo to README.md
 
 3/22/22 > Sorry for a lack of updates recently, I've been sick 
 
 3/16/22 > Vim has been added to Glacier's package collection as a source package. Additionally, a couple of bugs have been ironed out. To install vim, you must be on the latest version of Glacier. This can be done by cloning this repository, marking UPDATE-GLACIER.sh as executable, and running it as root. I plan on porting more vital system software to the repositories before I release another Everest tarball. Current version: (0.3rc)
 
 3/10/22 > Proper error handling has finally been added! If an operation fails, the package manager will quit, instead of continuing with the operation. Current version: (0.2rc)

# Roadmap

Future: musl libc and musl compiler compatability (change gcc to $CC) (no clue why this is here because its already done lol)

Sometime within the next few months: command line parsing and multi-repository support, all neccessary packages ported (still need more GNU packages)
