# Glacier
Glacier is the package manager developed for Everest Linux. It fetches packages from https://github.com/everest-linux/glacier-pkgs

For Glacier to work properly, it needs the following directories to be made:

  `/etc/glacier/pkginfo`
  
 ## Latest News
 
 3/16/22 > Vim has been added to Glacier's package collection as a source package. Additionally, a couple of bugs have been ironed out. To install vim, you must be on the latest version of Glacier. This can be done by cloning this repository, marking UPDATE-GLACIER.sh as executable, and running it as root. I plan on porting more vital system software to the repositories before I release another Everest tarball.
 
 3/10/22 > Proper error handling has finally been added! If an operation fails, the package manager will quit, instead of continuing with the operation. Current version: (0.2rc)
