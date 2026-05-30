################################################################################
#
# uboot-vim1s
#
################################################################################

UBOOT_VIM1S_VERSION = 2019.01
UBOOT_VIM1S_BOOT_SRC = u-boot.bin.sd.bin.signed:u-boot.bin.sd.signed

$(eval $(boot-package))
