OrangePi PC

Intro
=====

This default configuration will allow you to start experimenting with the
buildroot environment for the OrangePi PC. With the current configuration
it will bring-up the board, and allow access trough the serial console.

Unfortunately this boards processor is not yet supported by the
mainline kernel, and therefore this default configuration is using a
private Linux kernel repository based on 4.4-rc.

How to build it
===============

Configure Buildroot:

    $ make orangepipc_defconfig

Compile everything and build the SD card image:

    $ make

How to write the SD card
========================

Once the build process is finished you will have an image called "sdcard.img"
in the output/images/ directory.

Copy the bootable "sdcard.img" onto an SD card with "dd":

  $ sudo dd if=output/images/sdcard.img of=/dev/sdX
