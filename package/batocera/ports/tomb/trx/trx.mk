################################################################################
#
# trx
#
################################################################################
# Version: Commits on Aug 20, 2026
TRX_VERSION = trx-1.10.2
TRX_SITE = $(call github,LostArtefacts,TRX,$(TRX_VERSION))
TRX_LICENSE = GPL-3.0 license
TRX_LICENSE_FILES = COPYING.md
TRX_SUPPORTS_IN_SOURCE_BUILD = NO
TRX_SUBDIR = src
TRX_EMULATOR_INFO = trx.emulator.yml
TRX_DEPENDENCIES = ffmpeg libglew pcre2 sdl2 uthash

TRX_CONF_OPTS = -Dstaticdeps=false

define TRX_INSTALL_TARGET_CMDS
	rm -rf $(TARGET_DIR)/usr/bin/trx
	rm -rf $(TARGET_DIR)/usr/bin/TRX
	mkdir -p $(TARGET_DIR)/usr/bin/trx
	cp -f $(@D)/src/buildroot-build/TRX $(TARGET_DIR)/usr/bin/trx/
	cp -rf $(@D)/data/trx/ship/* $(TARGET_DIR)/usr/bin/trx/
endef

$(eval $(meson-package))
$(eval $(emulator-info-package))
