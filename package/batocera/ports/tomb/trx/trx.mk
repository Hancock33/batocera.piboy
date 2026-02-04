################################################################################
#
# trx
#
################################################################################
# Version: Commits on Feb 04, 2026
TRX_VERSION = dc69405b9f948b0cb2a380256f3819a51b588331
TRX_SITE = $(call github,LostArtefacts,TRX,$(TRX_VERSION))
TRX_LICENSE = GPL-3.0 license
TRX_LICENSE_FILES = COPYING.md
TRX_SUPPORTS_IN_SOURCE_BUILD = NO
TRX_SUBDIR = src
TR1X_EMULATOR_INFO = trx.emulator.yml
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
$(eval $(emulator-info-package))
