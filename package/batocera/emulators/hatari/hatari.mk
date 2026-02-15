################################################################################
#
# hatari
#
################################################################################
# Version: Commits on Feb 14, 2026
HATARI_VERSION = 1e484936b7b23276d3972a131bad52a6d87b65ec
HATARI_SITE = $(call github,hatari,hatari,$(HATARI_VERSION))
HATARI_LICENSE = GPLv3
HATARI_DEPENDENCIES = sdl2 zlib libpng libcapsimage
HATARI_EMULATOR_INFO = hatari.emulator.yml

HATARI_CONF_OPTS += -DBUILD_SHARED_LIBS=OFF
HATARI_CONF_OPTS += -DCAPSIMAGE_INCLUDE_DIR="($STAGING_DIR)/usr/include/caps"

define HATARI_INSTALL_TARGET_CMDS
	$(INSTALL) -D $(@D)/src/hatari $(TARGET_DIR)/usr/bin/hatari
		mkdir -p $(TARGET_DIR)/usr/share/hatari
endef

$(eval $(cmake-package))
$(eval $(emulator-info-package))
