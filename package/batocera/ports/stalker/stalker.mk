################################################################################
#
# stalker
#
################################################################################
# Version: Commits on Feb 03, 2023
STALKER_VERSION = d19b7436cc80eb79b1db84e4a4f0c3877a9540ba
STALKER_SITE = https://github.com/OpenXRay/xray-16.git
STALKER_SITE_METHOD=git
STALKER_GIT_SUBMODULES=YES

STALKER_DEPENDENCIES = sdl2 sdl2_mixer
STALKER_LICENSE = GPL-2.0

STALKER_SUPPORTS_IN_SOURCE_BUILD = NO
STALKER_CONF_OPTS += -DCMAKE_BUILD_TYPE=Release
STALKER_CONF_OPTS += -DSDL2=ON

define STALKER_EVMAPY
	# evmap config
	mkdir -p $(TARGET_DIR)/usr/share/evmapy
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/ports/stalker/stalker.keys $(TARGET_DIR)/usr/share/evmapy
endef

STALKER_POST_INSTALL_TARGET_HOOKS += STALKER_EVMAPY

$(eval $(cmake-package))