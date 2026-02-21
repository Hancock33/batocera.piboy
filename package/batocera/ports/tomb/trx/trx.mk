################################################################################
#
# trx
#
################################################################################
# Version: Commits on Feb 21, 2026
TRX_VERSION = 00ca7af5edce7e274010613414602512001d6b50
TRX_SITE = $(call github,LostArtefacts,TRX,$(TRX_VERSION))
TRX_LICENSE = GPL-3.0 license
TRX_LICENSE_FILES = COPYING.md
TRX_SUPPORTS_IN_SOURCE_BUILD = NO
TRX_SUBDIR = src
TRX_EMULATOR_INFO = tr1x.emulator.yml tr2x.emulator.yml
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
