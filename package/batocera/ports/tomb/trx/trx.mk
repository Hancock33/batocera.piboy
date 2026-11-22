################################################################################
#
# trx
#
################################################################################
# Version: Commits on Nov 02, 2026
TRX_VERSION = trx-1.12
TRX_SITE = $(call github,LostArtefacts,TRX,$(TRX_VERSION))
TRX_LICENSE = GPL-3.0
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
	$(INSTALL) -m 0755 -D -t $(TARGET_DIR)/usr/bin/trx $(@D)/src/buildroot-build/TRX
	cp -rf $(@D)/data/trx/ship/* $(TARGET_DIR)/usr/bin/trx/
endef

$(eval $(meson-package))
$(eval $(emulator-info-package))
