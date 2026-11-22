################################################################################
#
# hatari
#
################################################################################
# Version: Commits on Nov 22, 2026
HATARI_VERSION = 96c722839fa4cf6dad87cb90d8b377deec28f0fa
HATARI_SITE = $(call github,hatari,hatari,$(HATARI_VERSION))
HATARI_LICENSE = GPL-3.0
HATARI_DEPENDENCIES = sdl2 zlib libpng libcapsimage
HATARI_EMULATOR_INFO = hatari.emulator.yml

HATARI_CONF_OPTS += -DBUILD_SHARED_LIBS=OFF

define HATARI_INSTALL_TARGET_CMDS
	$(INSTALL) -m 0755 -D $(@D)/src/hatari $(TARGET_DIR)/usr/bin/hatari
	mkdir -p $(TARGET_DIR)/usr/share/hatari
endef

$(eval $(cmake-package))
$(eval $(emulator-info-package))
