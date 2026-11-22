################################################################################
#
# uboot-orangepi-4a
#
################################################################################

UBOOT_ORANGEPI_4A_VERSION = v2018.05-t527
UBOOT_ORANGEPI_4A_LICENSE = GPL-2.0+
UBOOT_ORANGEPI_4A_BOOT_SRC = boot0_sdcard.fex boot_package.fex

$(eval $(boot-package))
