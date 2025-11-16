################################################################################
#
# trx
#
################################################################################
# Version: Commits on Nov 16, 2025
TRX_VERSION = b32da93bfb93bdca9a3659d9962fb6d8a9df0956
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
	cp -f $(@D)/src/buildroot-build/TRX $(TARGET_DIR)/usr/bin/tr1x/TR1X
	cp -f $(@D)/src/buildroot-build/TRX $(TARGET_DIR)/usr/bin/tr2x/TR2X
	cp -rf $(@D)/data/tr1/ship/* $(TARGET_DIR)/usr/bin/tr1x/
	cp -rf $(@D)/data/tr2/ship/* $(TARGET_DIR)/usr/bin/tr2x/
endef

$(eval $(meson-package))
