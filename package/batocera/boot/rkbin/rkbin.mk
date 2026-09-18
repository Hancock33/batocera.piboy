################################################################################
#
# rkbin
#
################################################################################
# Version: Commits on Jun 26, 2026
RKBIN_VERSION = 3e288fe814e059dd06833495f845cab04ac20a5c
RKBIN_SITE = https://github.com/rockchip-linux/rkbin.git
RKBIN_SITE_METHOD = git
RKBIN_LICENSE = PROPRIETARY
RKBIN_INSTALL_IMAGES = YES

define RKBIN_INSTALL_IMAGES_CMDS
	mkdir -p $(BINARIES_DIR)/rkbin
	cp -a $(@D)/* $(BINARIES_DIR)/rkbin
endef

$(eval $(generic-package))
