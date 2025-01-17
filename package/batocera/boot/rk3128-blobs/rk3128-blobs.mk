################################################################################
#
# rk3128-blobs
#
################################################################################
# Version: Commits on Dec 19, 2024
RK3128_BLOBS_VERSION = 0f8ac860f0479da56a1decae207ddc99e289f2e2
RK3128_BLOBS_SITE = https://github.com/rockchip-linux/rkbin.git
RK3128_BLOBS_SITE_METHOD = git
RK3128_BLOBS_INSTALL_IMAGES = YES

define RK3128_BLOBS_INSTALL_IMAGES_CMDS
	mkdir -p $(BINARIES_DIR)/rkbin
	cp -a $(@D)/* $(BINARIES_DIR)/rkbin
	cp $(@D)/bin/rk31/rk3128_ddr_300MHz_v2.12.bin $(BINARIES_DIR)
endef

$(eval $(generic-package))
