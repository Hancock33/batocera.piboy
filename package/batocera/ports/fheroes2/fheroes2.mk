################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Nov 17, 2023
FHEROES2_VERSION = 79f03699f436a3f876245c07d6a63e0df8b92fb3
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
