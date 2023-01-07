################################################################################
#
# stalker
#
################################################################################
# Version: Commits on Jan 06, 2023
STALKER_VERSION = 057fd7251f2c680fd5a7e9cf8ca4477050ca6a04
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
