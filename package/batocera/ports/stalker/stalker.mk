################################################################################
#
# stalker
#
################################################################################
# Version: Commits on Feb 28, 2025
STALKER_VERSION = 807b611a05bb8cf2cba23a7251049a0b5da83ae4
STALKER_SITE = https://github.com/OpenXRay/xray-16.git
STALKER_SITE_METHOD=git
STALKER_GIT_SUBMODULES=YES
STALKER_SUPPORTS_IN_SOURCE_BUILD = NO
STALKER_DEPENDENCIES = sdl2 sdl2_mixer
STALKER_LICENSE = GPL-2.0

STALKER_CONF_OPTS += -DCMAKE_CXX_COMPILER=$(HOST_DIR)/bin/$(GNU_TARGET_NAME)-g++
STALKER_CONF_OPTS += -DMEMORY_ALLOCATOR=standard
STALKER_CONF_OPTS += -DUSE_LTO=OFF

$(eval $(cmake-package))
