################################################################################
#
# stalker
#
################################################################################
# Version: Commits on Oct 11, 2026
STALKER_VERSION = 3917383bd7cd5ac557fd8cef89956ff8b8a27df4
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
