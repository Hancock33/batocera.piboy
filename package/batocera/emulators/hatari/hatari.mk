################################################################################
#
# hatari
#
################################################################################
# Version: Commits on Apr 02, 2026
HATARI_VERSION = eade8be64a1ac1472c2e38d12ad2abbfc1c321ee
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
