################################################################################
#
# corsixth
#
################################################################################
# Version: Commits on Oct 25, 2023
CORSIXTH_VERSION = 15368f125f16f36350d3bfb558374532eff1d9a1
CORSIXTH_SITE = $(call github,CorsixTH,CorsixTH,$(CORSIXTH_VERSION))
CORSIXTH_DEPENDENCIES = sdl2 sdl2_image luajit luafilesystem lua-lpeg-patterns lpeg
CORSIXTH_LICENSE = GPL-2.0
CORSIXTH_SUPPORTS_IN_SOURCE_BUILD = NO

CORSIXTH_CONF_OPTS += -DWITH_LIBAV=ON

ifeq ($(BR2_PACKAGE_LUAJIT),y)
CORSIXTH_CONF_OPTS += -DWITH_LUAJIT=ON
CORSIXTH_CONF_ENV += LDFLAGS="-lluajit-5.2"
endif

define CORSIXTH_INSTALL_EXTRAS
	# evmap config
	mkdir -p $(TARGET_DIR)/usr/share/evmapy
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/ports/corsixth/corsixth.keys $(TARGET_DIR)/usr/share/evmapy/themehospital.keys
endef

CORSIXTH_PRE_INSTALL_TARGET_HOOKS += CORSIXTH_INSTALL_EXTRAS

define CORSIXTH_INSTALL_EVMAPY
        # evmap config
        mkdir -p $(TARGET_DIR)/usr/share/evmapy
        cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/ports/corsixth/corsixth.keys $(TARGET_DIR)/usr/share/evmapy
endef

CORSIXTH_POST_INSTALL_TARGET_HOOKS += CORSIXTH_INSTALL_EVMAPY

$(eval $(cmake-package))
