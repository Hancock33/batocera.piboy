################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Oct 08, 2023
FHEROES2_VERSION = f72fbaadc236710008d61bbc44ab0e83d610ece3
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
