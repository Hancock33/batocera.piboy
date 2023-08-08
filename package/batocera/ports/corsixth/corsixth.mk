################################################################################
#
# corsixth
#
################################################################################
# Version: Commits on Aug 06, 2023
CORSIXTH_VERSION = fc38c4f46913b7b91c0b1b53efd7c7f2764adb20
CORSIXTH_SITE = $(call github,CorsixTH,CorsixTH,$(CORSIXTH_VERSION))
CORSIXTH_DEPENDENCIES = sdl2 sdl2_mixer
CORSIXTH_LICENSE = GPL-2.0
CORSIXTH_SUPPORTS_IN_SOURCE_BUILD = NO
CORSIXTH_CMAKE_BACKEND = ninja

CORSIXTH_CONF_OPTS += -DCMAKE_BUILD_TYPE=Release -DWITH_LIBAV=ON

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

$(eval $(cmake-package))
