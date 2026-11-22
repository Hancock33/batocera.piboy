################################################################################
#
# stalker
#
################################################################################
# Version: Commits on Nov 16, 2026
STALKER_VERSION = d1eb5d39a81ec41a5a30383822e5706e4b13b37c
STALKER_BRANCH = dev
STALKER_SITE = https://github.com/OpenXRay/xray-16.git
STALKER_SITE_METHOD=git
STALKER_GIT_SUBMODULES=YES
STALKER_SUPPORTS_IN_SOURCE_BUILD = NO
STALKER_EMULATOR_INFO = stalker.emulator.yml
STALKER_DEPENDENCIES = sdl2 sdl2_mixer
STALKER_LICENSE = GPL-2.0

STALKER_CONF_OPTS += -DCMAKE_C_COMPILER=$(TARGET_CC)
STALKER_CONF_OPTS += -DCMAKE_CXX_COMPILER=$(TARGET_CXX)
STALKER_CONF_OPTS += -DUSE_LTO=ON

$(eval $(cmake-package))
$(eval $(emulator-info-package))
