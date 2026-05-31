################################################################################
#
# uboot-orangepi-4-lts
#
################################################################################

UBOOT_ORANGEPI_4_LTS_VERSION = 2022.04-armbian
UBOOT_ORANGEPI_4_LTS_BOOT_SRC = idbloader.bin trust.bin uboot.img:u-boot.img

$(eval $(boot-package))
