################################################################################
#
# rk3128-blobs
#
################################################################################
# Version: Commits on Feb 22, 2024
RK3128_BLOBS_VERSION = a2a0b89b6c8c612dca5ed9ed8a68db8a07f68bc0
RK3128_BLOBS_SITE = https://github.com/rockchip-linux/rkbin.git
RK3128_BLOBS_SITE_METHOD = git
RK3128_BLOBS_INSTALL_IMAGES = YES

define RK3128_BLOBS_INSTALL_IMAGES_CMDS
	mkdir -p $(BINARIES_DIR)/rkbin
	cp -a $(@D)/* $(BINARIES_DIR)/rkbin
	cp $(@D)/bin/rk31/rk3128_ddr_300MHz_v2.12.bin $(BINARIES_DIR)
endef

$(eval $(generic-package))
