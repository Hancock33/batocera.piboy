################################################################################
#
# trx
#
################################################################################
# Version: Commits on Nov 02, 2025
TRX_VERSION = 0044a8c3bd4ccfd198d3fc841de6ad5630a66128
TRX_SITE = $(call github,LostArtefacts,TRX,$(TRX_VERSION))
TRX_LICENSE = GPL-3.0 license
TRX_LICENSE_FILES = COPYING.md
TRX_SUPPORTS_IN_SOURCE_BUILD = NO
TRX_SUBDIR = src

TRX_DEPENDENCIES = ffmpeg libglew pcre2 sdl2 uthash

TRX_CONF_OPTS = -Dstaticdeps=false

define TRX_INSTALL_TARGET_CMDS
	rm -rf $(TARGET_DIR)/usr/bin/{tr1x,tr2x}
	mkdir -p $(TARGET_DIR)/usr/bin/{tr1x,tr2x}
	cp -f $(@D)/src/buildroot-build/TR1X $(TARGET_DIR)/usr/bin/tr1x/
	cp -f $(@D)/src/buildroot-build/TR2X $(TARGET_DIR)/usr/bin/tr2x/
	cp -rf $(@D)/data/tr1/ship/* $(TARGET_DIR)/usr/bin/tr1x/
	cp -rf $(@D)/data/tr2/ship/* $(TARGET_DIR)/usr/bin/tr2x/
endef

$(eval $(meson-package))
