################################################################################
#
# stalker
#
################################################################################
# Version: Commits on Oct 04, 2026
STALKER_VERSION = 231873639b1290b58c11a2f634a8a54e564615e7
STALKER_BRANCH = dev
STALKER_SITE = https://github.com/OpenXRay/xray-16.git
STALKER_SITE_METHOD=git
STALKER_GIT_SUBMODULES=YES
STALKER_SUPPORTS_IN_SOURCE_BUILD = NO
STALKER_EMULATOR_INFO = stalker.emulator.yml
STALKER_DEPENDENCIES = sdl2 sdl2_mixer
STALKER_LICENSE = GPL-2.0

STALKER_CONF_OPTS += -DCMAKE_C_COMPILER=$(HOST_DIR)/bin/$(GNU_TARGET_NAME)-gcc
STALKER_CONF_OPTS += -DCMAKE_CXX_COMPILER=$(HOST_DIR)/bin/$(GNU_TARGET_NAME)-g++
STALKER_CONF_OPTS += -DUSE_LTO=ON

$(eval $(cmake-package))
$(eval $(emulator-info-package))
