################################################################################
#
# uboot-vim4
#
################################################################################

UBOOT_VIM4_VERSION = 2019.01
UBOOT_VIM4_LICENSE = GPL-2.0+
UBOOT_VIM4_BOOT_SRC = u-boot.bin.sd.bin.signed:u-boot.bin.sd.signed

$(eval $(boot-package))
