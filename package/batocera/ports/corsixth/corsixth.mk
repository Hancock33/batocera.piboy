################################################################################
#
# Theme Hospital
#
################################################################################
# Version: Commits on May 20, 2022
CORSIXTH_VERSION = dec9d38e036ea3212ae538e78db18e5f71e71f66
CORSIXTH_SITE = $(call github,CorsixTH,CorsixTH,$(CORSIXTH_VERSION))

CORSIXTH_DEPENDENCIES = sdl2 sdl2_mixer freepats luafilesystem lua-lpeg-patterns
CORSIXTH_LICENSE = GPL-2.0
CORSIXTH_SUPPORTS_IN_SOURCE_BUILD = NO

CORSIXTH_CONF_OPTS += -DCMAKE_BUILD_TYPE=Release -DWITH_LIBAV=ON

define CORSIXTH_INSTALL_EXTRAS
	# evmap config
	mkdir -p $(TARGET_DIR)/usr/share/evmapy
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/ports/corsixth/corsixth.keys $(TARGET_DIR)/usr/share/evmapy/themehospital.keys
endef

CORSIXTH_PRE_INSTALL_TARGET_HOOKS += CORSIXTH_INSTALL_EXTRAS

$(eval $(cmake-package))
