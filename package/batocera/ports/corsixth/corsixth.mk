################################################################################
#
# corsixth
#
################################################################################
# Version: Commits on Apr 21, 2024
CORSIXTH_VERSION = c600596396284e6863d30572fa64b37a25d55b13
CORSIXTH_SITE = $(call github,CorsixTH,CorsixTH,$(CORSIXTH_VERSION))
CORSIXTH_DEPENDENCIES = sdl2 sdl2_image lua luafilesystem lua-lpeg-patterns lpeg luasocket luasec
CORSIXTH_LICENSE = GPL-2.0
CORSIXTH_SUPPORTS_IN_SOURCE_BUILD = NO

CORSIXTH_CONF_OPTS += -DWITH_LUAJIT=OFF

define CORSIXTH_INSTALL_EVMAPY
        # evmap config
        mkdir -p $(TARGET_DIR)/usr/share/evmapy
        cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/ports/corsixth/corsixth.keys $(TARGET_DIR)/usr/share/evmapy
        cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/ports/corsixth/corsixth.keys $(TARGET_DIR)/usr/share/evmapy/themehospital.keys
endef

CORSIXTH_POST_INSTALL_TARGET_HOOKS += CORSIXTH_INSTALL_EVMAPY

$(eval $(cmake-package))
