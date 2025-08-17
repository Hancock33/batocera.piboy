################################################################################
#
# stalker
#
################################################################################
# Version: Commits on Aug 12, 2025
STALKER_VERSION = eafe96c3f6cb38a79e756e6dca43bbedb35a1e0f
STALKER_BRANCH = dev
STALKER_SITE = https://github.com/OpenXRay/xray-16.git
STALKER_SITE_METHOD=git
STALKER_GIT_SUBMODULES=YES
STALKER_SUPPORTS_IN_SOURCE_BUILD = NO
STALKER_DEPENDENCIES = sdl2 sdl2_mixer
STALKER_LICENSE = GPL-2.0

STALKER_CONF_OPTS += -DCMAKE_C_COMPILER=$(HOST_DIR)/bin/$(GNU_TARGET_NAME)-gcc
STALKER_CONF_OPTS += -DCMAKE_CXX_COMPILER=$(HOST_DIR)/bin/$(GNU_TARGET_NAME)-g++
STALKER_CONF_OPTS += -DUSE_LTO=ON

$(eval $(cmake-package))

