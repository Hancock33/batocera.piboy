################################################################################
#
# stalker
#
################################################################################
# Version: Commits on Oct 08, 2022
STALKER_VERSION = 151b91dd7f9ea8b639e8b2e244e680f15009e11e
STALKER_SITE = https://github.com/OpenXRay/xray-16.git
STALKER_SITE_METHOD=git
STALKER_GIT_SUBMODULES=YES

STALKER_DEPENDENCIES = sdl2 sdl2_mixer
STALKER_LICENSE = GPL-2.0

STALKER_SUPPORTS_IN_SOURCE_BUILD = NO
STALKER_CONF_OPTS += -DCMAKE_BUILD_TYPE=Release
STALKER_CONF_OPTS += -DSDL2=ON
STALKER_CONF_OPTS += -DCMAKE_C_FLAGS="-O3 -pipe"
STALKER_CONF_OPTS += -DCMAKE_CXX_FLAGS="-O3 -pipe"

$(eval $(cmake-package))
