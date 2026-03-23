################################################################################
#
# corsixth
#
################################################################################
# Version: Commits on Mar 22, 2026
CORSIXTH_VERSION = d5ecdad2007683b3dec7cc47c748f9548ff0b43c
CORSIXTH_SITE = $(call github,CorsixTH,CorsixTH,$(CORSIXTH_VERSION))
CORSIXTH_DEPENDENCIES = ffmpeg libcurl lpeg lua luafilesystem lua-lpeg-patterns luasec luasocket rtmidi sdl2 sdl2_image sdl2_mixer
CORSIXTH_LICENSE = GPL-2.0
CORSIXTH_SUPPORTS_IN_SOURCE_BUILD = NO
CORSIXTH_EMULATOR_INFO = themehospital.emulator.yml

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
