################################################################################
#
# stalker
#
################################################################################
# Version: Commits on Oct 18, 2023
STALKER_VERSION = 38ac96961f1c94cd609ebaf0cfbe307b725506f9
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
