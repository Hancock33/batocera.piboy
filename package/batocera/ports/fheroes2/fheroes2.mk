################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on May 04, 2024
FHEROES2_VERSION = 308eda1ff03ef0f71860e035e88de503ad2a689a
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
