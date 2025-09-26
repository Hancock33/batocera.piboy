################################################################################
#
# corsixth
#
################################################################################
# Version: Commits on Sept 25, 2025
CORSIXTH_VERSION = bb513746ae8f74d8b0f32dc14976952295d4f775
CORSIXTH_SITE = $(call github,CorsixTH,CorsixTH,$(CORSIXTH_VERSION))
CORSIXTH_DEPENDENCIES = ffmpeg libcurl lpeg lua luafilesystem lua-lpeg-patterns luasec luasocket sdl2 sdl2_image sdl2_mixer
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
