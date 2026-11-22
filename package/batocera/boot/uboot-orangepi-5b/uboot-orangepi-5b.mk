################################################################################
#
# uboot-orangepi-5b
#
################################################################################

UBOOT_ORANGEPI_5B_VERSION = 1.0.8
UBOOT_ORANGEPI_5B_LICENSE = GPL-2.0+
UBOOT_ORANGEPI_5B_BOOT_SRC = idbloader.img u-boot.itb rkspi_loader.img

$(eval $(boot-package))
