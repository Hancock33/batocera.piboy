################################################################################
#
# corsixth
#
################################################################################
# Version: Commits on Feb 14, 2026
CORSIXTH_VERSION = fe4d0707690d1028a39a09a4da90ed38383cc219
CORSIXTH_SITE = $(call github,CorsixTH,CorsixTH,$(CORSIXTH_VERSION))
CORSIXTH_DEPENDENCIES = ffmpeg libcurl lpeg lua luafilesystem lua-lpeg-patterns luasec luasocket rtmidi sdl2 sdl2_image sdl2_mixer
CORSIXTH_LICENSE = GPL-2.0
CORSIXTH_SUPPORTS_IN_SOURCE_BUILD = NO
CORSIXTH_EMULATOR_INFO = corsixth.emulator.yml

CORSIXTH_CONF_OPTS += -DWITH_LUAJIT=OFF

define CORSIXTH_INSTALL_EVMAPY
	# evmap config
	mkdir -p $(TARGET_DIR)/usr/share/evmapy
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/ports/corsixth/corsixth.keys $(TARGET_DIR)/usr/share/evmapy
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/ports/corsixth/corsixth.keys $(TARGET_DIR)/usr/share/evmapy/themehospital.keys
endef

CORSIXTH_POST_INSTALL_TARGET_HOOKS += CORSIXTH_INSTALL_EVMAPY

$(eval $(cmake-package))
$(eval $(emulator-info-package))
