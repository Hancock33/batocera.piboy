################################################################################
#
# hatari
#
################################################################################
# Version: Commits on Aug 22, 2026
HATARI_VERSION = 61de9d8071fa7e6cbdcca3d3f33b5456301d80b1
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
