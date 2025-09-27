################################################################################
#
# openjk
#
################################################################################
# Version: Commits on Sept 26, 2025
OPENJK_VERSION = 1dd147b0f2ab8b63bb7e04256c967c4561964772
OPENJK_SITE = $(call github,JACoders,OpenJK,$(OPENJK_VERSION))
OPENJK_DEPENDENCIES += host-libjpeg libpng openal sdl2 zlib
OPENJK_LICENSE = GPL-2.0
OPENJK_SUPPORTS_IN_SOURCE_BUILD = NO

OPENJK_CONF_OPTS += -DBUILD_SHARED_LIBS=OFF
OPENJK_CONF_OPTS += -DCMAKE_INSTALL_PREFIX="/usr/bin"
#Single player
OPENJK_CONF_OPTS += -DBuildSPEngine=ON
OPENJK_CONF_OPTS += -DBuildSPGame=ON
OPENJK_CONF_OPTS += -DBuildSPRdVanilla=ON
OPENJK_CONF_OPTS += -DBuildJK2SPEngine=ON
OPENJK_CONF_OPTS += -DBuildJK2SPGame=ON
OPENJK_CONF_OPTS += -DBuildJK2SPRdVanilla=ON
OPENJK_CONF_OPTS += -DBuildMPRend2=OFF
#Multi player
OPENJK_CONF_OPTS += -DBuildMPEngine=OFF
OPENJK_CONF_OPTS += -DBuildMPRdVanilla=OFF
OPENJK_CONF_OPTS += -DBuildMPDed=OFF
OPENJK_CONF_OPTS += -DBuildMPGame=OFF
OPENJK_CONF_OPTS += -DBuildMPCGame=OFF
OPENJK_CONF_OPTS += -DBuildMPUI=OFF

define OPENJK_EVMAPY
	mkdir -p $(TARGET_DIR)/usr/share/evmapy
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/ports/openjk/openjk.keys $(TARGET_DIR)/usr/share/evmapy
endef

OPENJK_POST_INSTALL_TARGET_HOOKS += OPENJK_EVMAPY

$(eval $(cmake-package))
