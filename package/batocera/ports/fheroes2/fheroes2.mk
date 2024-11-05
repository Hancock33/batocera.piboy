################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Nov 04, 2024
FHEROES2_VERSION = 2476bbc5b2ad63d8766a0aa9d21b3608a561d09c
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
