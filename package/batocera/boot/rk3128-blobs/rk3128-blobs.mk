################################################################################
#
# rk3128-blobs
#
################################################################################
# Version: Commits on Jun 13, 2025
RK3128_BLOBS_VERSION = 74213af1e952c4683d2e35952507133b61394862
RK3128_BLOBS_SITE = https://github.com/rockchip-linux/rkbin.git
RK3128_BLOBS_SITE_METHOD = git
RK3128_BLOBS_INSTALL_IMAGES = YES

define RK3128_BLOBS_INSTALL_IMAGES_CMDS
	mkdir -p $(BINARIES_DIR)/rkbin
	cp -a $(@D)/* $(BINARIES_DIR)/rkbin
	cp $(@D)/bin/rk31/rk3128_ddr_300MHz_v2.12.bin $(BINARIES_DIR)
endef

$(eval $(generic-package))
