![alt text](https://raw.githubusercontent.com/everest-linux/amogus3016/main/glacierlogo.png)

# Glacier
Glacier is the package manager developed for Everest Linux. It fetches packages from https://github.com/everest-linux/glacier-pkgs

For Glacier to work properly, you need to have both wget and tar installed.

Glacier depends on wget and tar for its backends. It also requires a working C compiler for source packages to work correctly. Some packages may have their own sets of dependencies. All of these are configured by default in the Everest rootfs tarball, but you may need some extra configuration to get these programs on other distros, most notably, Arch and its derivatives.

Glacier is intended to be a universal package manager, and should work on all distros, providing you have wget and tar installed. For the sake of compatibility, all scripts submitted should contain **NON DISTRO SPECIFIC COMMANDS**.

# Submitting Packages

Packages should be submitted by sending a pull request. A maintainer will test the package to make sure it downloads correctly.
  
# Latest News
 
 3/28/22 (again) > Added package caching. This is useful if the user wishes to customize package instruction scripts before installing. 0.5rc
 
 3/28/22 > Recovered from sickness, released 0.4rc. This update provides proper cleanup after an operation is complete. This is done by making a temporary directory that the tarball will be unpacked into. Also added the logo to README.md
 
 3/22/22 > Sorry for a lack of updates recently, I've been sick 
 
 3/16/22 > Vim has been added to Glacier's package collection as a source package. Additionally, a couple of bugs have been ironed out. To install vim, you must be on the latest version of Glacier. This can be done by cloning this repository, marking UPDATE-GLACIER.sh as executable, and running it as root. I plan on porting more vital system software to the repositories before I release another Everest tarball. Current version: (0.3rc)
 
 3/10/22 > Proper error handling has finally been added! If an operation fails, the package manager will quit, instead of continuing with the operation. Current version: (0.2rc)
