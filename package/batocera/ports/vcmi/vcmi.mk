################################################################################
#
# vcmi
#
################################################################################
# Version: Commits on Nov 03, 2022
VCMI_VERSION = ae1d2c50e2d000df5ce5569550f8722345c8067a
VCMI_SITE = https://github.com/vcmi/vcmi.git
VCMI_SITE_METHOD=git
VCMI_GIT_SUBMODULES=YES
VCMI_DEPENDENCIES = sdl2 sdl2_image sdl2_mixer sdl2_ttf ffmpeg

VCMI_CONF_OPTS += -DENABLE_TEST=OFF -DENABLE_LAUNCHER=OFF -DENABLE_EDITOR=OFF -DENABLE_GITVERSION=OFF

define VCMI_EVMAPY
	# evmap config
	mkdir -p $(TARGET_DIR)/usr/share/evmapy
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/ports/vcmi/vcmi.keys $(TARGET_DIR)/usr/share/evmapy
	# configs
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/ports/vcmi/*.json $(TARGET_DIR)/usr/share/vcmi/
endef

VCMI_POST_INSTALL_TARGET_HOOKS += VCMI_EVMAPY

$(eval $(cmake-package))