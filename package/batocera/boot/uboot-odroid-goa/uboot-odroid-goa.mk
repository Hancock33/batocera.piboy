################################################################################
#
# uboot-odroid-goa
#
################################################################################
# Version: Commits on Apr 25, 2022
UBOOT_ODROID_GOA_VERSION = 154ddfc826e72c902232169b676b2a4e59c75171
UBOOT_ODROID_GOA_SITE = https://github.com/hardkernel/u-boot.git
UBOOT_ODROID_GOA_SITE_METHOD=git

UBOOT_ODROID_GOA_DEPENDENCIES = host-toolchain-external-linaro-aarch64

define UBOOT_ODROID_GOA_BUILD_CMDS
		cd $(@D) && $(@D)/make.sh odroidgoa
endef

define UBOOT_ODROID_GOA_INSTALL_TARGET_CMDS
	cp $(@D)/sd_fuse/idbloader.img	$(BINARIES_DIR)/idbloader.img
	cp $(@D)/sd_fuse/uboot.img		$(BINARIES_DIR)/uboot.img
	cp $(@D)/sd_fuse/trust.img		$(BINARIES_DIR)/trust.img
endef

$(eval $(generic-package))
