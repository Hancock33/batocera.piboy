################################################################################
#
# stalker
#
################################################################################
# Version: Commits on Aug 10, 2022
STALKER_VERSION = 693bc8e491aef4d75454464400c66be9a42ec816
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
