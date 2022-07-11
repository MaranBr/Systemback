# Systemback

This is a fork of Systemback. The [original project](https://sourceforge.net/projects/systemback) is no longer maintained by the creator.

It's a simple system backup and restore application with extra features.

Systemback makes it easy to create backups of the system, configuration files, and user files. In case of problems you can easily restore the previous state of the system.

## Donate

Systemback is free so you can use it without any limitations.

Keeping the project alive takes a lot of work and research. If you want to contribute, you can help with a small donation. Any amount will be very welcome. Your contribution will help keep the project running for a long time.

I hope this program will be very useful to you.

You can donate by clicking on [this link](https://www.paypal.com/donate/?hosted_button_id=NT6YZP9PV7SY6 "Click to Donate Here").

or

By scanning the QR Code below.

![QR Code](.donate/image/MaranBr.png "Scan to Donate Here")

## Features

- System backup
- System copy
- System install
- System repair
- System restore
- System upgrade
- Live system create

## Requirements

Works as expected on:

- Linux Mint 19/20

It's possible that it works on other equivalent distributions based on Ubuntu as well.

## Downloads

You can get the latest builds on the [release page](https://github.com/MaranBr/Systemback/releases).

## Build From Source

### Install Build Dependencies

Install all dependencies needed to compile the source code using the command below:

```
$ sudo apt-get install build-essential debhelper devscripts libblkid-dev libmount-dev libncursesw5-dev libparted-dev qtbase5-dev qttools5-dev-tools git-all gnupg
```

### Generate GPG Key

If needed, you can generate a GPG key to sign the build for distribution using the command below:

```
$ gpg --full-generate-key
```

You will also need to change the `systemback/debian/changelog` in the application's source code to match the information used to generate the GPG key.

### Build Systemback

Clone the repository and follow the steps below:

```
$ git clone https://github.com/MaranBr/Systemback
```
```
$ cd Systemback/systemback
```

Generate signed builds (a valid gpg key is required):

```
$ debuild
```

Generate unsigned builds (no gpg key is required):

```
$ debuild -us -uc
```

The build files will be generated inside the Systemback root directory.

### Install Systemback

In the Systemback root directory, run dpkg command to install the packages:

```
$ cd Systemback
```
```
$ sudo dpkg -i *.deb
```

## Changelog

- **1.8.607**
  - Some minor fixes and improvements

- **1.8.606**
  - Clean up the code and fix some bugs
  - Fix Portuguese (Brazil) translations

- **1.8.605**
  - Change the behavior where files larger than 8 MB were not transferred when installing the live system using default settings

- **1.8.604**
  - Fix Zenity not resizing dialog boxes properly
  - Fix XDG_RUNTIME_DIR not set properly
  - Fix permission check on storage directory and working directory

- **1.8.603**
  - Change some menus and fix a few things
  - Import missing Portuguese (Brazil) translations

- **1.8.602**
  - Fix symbolic links missing after install system image (usrmerge)

- **1.8.601**
  - Add support for large ISO images
  - Add support for NVMe

- **1.8.600**
  - Add support for Linux Mint 20
  - Update EFI boot files

- **1.8.501**
  - Set userdatafilescopy as default
  - Set autoisocreate as default
  - Set usexzcompressor as default

- **1.8.500**
  - Fix '(initramfs) /cow format specified as aufs and no support found' when trying to boot the Live system
  - Add support for Linux Mint 19
  - Update EFI boot files

- **1.8.402**
  - Fix Live creation when the '/snap' directory is missing

- **1.8.400**
  - Add support to installed Snap packages
  - Remove support to old (version 1.5 and below) restore points
  - Fix possible segmentation fault when checking directory mount status
  - Fix translation files detection in DBGLEV=3 mode
  - Fix source code compilation under Ubuntu 14.04
  - Import new Romanian translations

- **1.8.300**
  - Fix the possible conflict with the APT when updating the package index files
  - Import new EFI boot files from the Ubuntu 16.04 LTS
  - Import new Czech, English (United Kingdom), Hungarian, Romanian and Spanish
    translations

- **1.8.202**
  - Improve compatibility with apt 1.2
  - Update EFI boot files
  - Import new Spanish, Danish and Chinese (Simplified) translations

- **1.8.201**
  - Fix restore point creation when the storage dir path contains symbolic link
  - Fix some directory date and time settings when creating restore points

- **1.8.200**
  - Fix line breaking when printing the mounted filesystems in DBGLEV=3 mode
  - Fix error messages printing when upgrading the system
  - Fix the GRUB menu height on the Live when the system contains xorg.conf file(s)
  - Detect and takes into account the configuration file(s) in the /etc/X11/xorg.conf.d directory
  - Update EFI boot files
  - Import new Czech translations

- **1.8.102**
  - Fix possible segmentation fault when try to minimize the window with the button

- **1.8.101**
  - Fix partition information reading on Ubuntu 16.04

- **1.8.100**
  - Fix incorrect symlink following when creating a new incremental restore point (TeamViewer global.conf bug)
  - Add a new debug level (DBGLEV=3) for more debug information
  - Some minor fixes and improvements
  - Import new Hungarian translations
