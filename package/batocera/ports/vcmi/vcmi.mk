################################################################################
#
# vcmi
#
################################################################################
# Version: Commits on Feb 24, 2023
VCMI_VERSION = ddd9dcc91846e3064e61024684e5e7c02b9006bb
VCMI_SITE = https://github.com/vcmi/vcmi.git
VCMI_SITE_METHOD=git
VCMI_GIT_SUBMODULES=YES
VCMI_DEPENDENCIES = sdl2 sdl2_image sdl2_mixer sdl2_ttf ffmpeg

VCMI_CONF_OPTS += -DENABLE_TEST=OFF -DENABLE_LAUNCHER=OFF -DENABLE_EDITOR=OFF -DENABLE_GITVERSION=OFF

define VCMI_EVMAPY
	# evmap config
	mkdir -p $(TARGET_DIR)/usr/share/evmapy
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/ports/vcmi/vcmi.keys $(TARGET_DIR)/usr/share/evmapy
endef

VCMI_POST_INSTALL_TARGET_HOOKS += VCMI_EVMAPY

$(eval $(cmake-package))