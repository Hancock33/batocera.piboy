################################################################################
#
# rockpro64-blobs
#
################################################################################
# Version: Commits on Mar 03, 2020
ROCKPRO64_BLOBS_VERSION = 2.0
ROCKPRO64_BLOBS_SITE = https://github.com/batocera-linux/rockpro64-blobs.git
# rockpro64-blobs

define ROCKPRO64_BLOBS_INSTALL_TARGET_CMDS
	cp $(@D)/idbloader.img	$(BINARIES_DIR)/idbloader-rockpro64.img
	cp $(@D)/trust.img		$(BINARIES_DIR)/trust-rockpro64.img
	cp $(@D)/uboot.img		$(BINARIES_DIR)/u-boot-rockpro64.bin
endef

$(eval $(generic-package))
