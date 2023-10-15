################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Oct 15, 2023
FHEROES2_VERSION = 8dc3d3366139fa49c0b501f475697c4ae5a163dc
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
