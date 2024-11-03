################################################################################
#
# rk3128-blobs
#
################################################################################
# Version: Commits on Oct 23, 2024
RK3128_BLOBS_VERSION = 7c35e21a8529b3758d1f051d1a5dc62aae934b2b
RK3128_BLOBS_SITE = https://github.com/rockchip-linux/rkbin.git
RK3128_BLOBS_SITE_METHOD = git
RK3128_BLOBS_INSTALL_IMAGES = YES

define RK3128_BLOBS_INSTALL_IMAGES_CMDS
	mkdir -p $(BINARIES_DIR)/rkbin
	cp -a $(@D)/* $(BINARIES_DIR)/rkbin
	cp $(@D)/bin/rk31/rk3128_ddr_300MHz_v2.12.bin $(BINARIES_DIR)
endef

$(eval $(generic-package))
