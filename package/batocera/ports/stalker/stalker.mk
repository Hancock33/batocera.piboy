################################################################################
#
# stalker
#
################################################################################
# Version: Commits on Oct 26, 2023
STALKER_VERSION = 9b5a89088e320b3db78f13e530230e91097fec8e
STALKER_SITE = https://github.com/OpenXRay/xray-16.git
STALKER_SITE_METHOD=git
STALKER_GIT_SUBMODULES=YES

STALKER_DEPENDENCIES = sdl2 sdl2_mixer
STALKER_LICENSE = GPL-2.0

STALKER_SUPPORTS_IN_SOURCE_BUILD = NO

define STALKER_EVMAPY
	# evmap config
	mkdir -p $(TARGET_DIR)/usr/share/evmapy
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/ports/stalker/stalker.keys $(TARGET_DIR)/usr/share/evmapy
endef

STALKER_POST_INSTALL_TARGET_HOOKS += STALKER_EVMAPY

$(eval $(cmake-package))
