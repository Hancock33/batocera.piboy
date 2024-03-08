################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Mar 08, 2024
FHEROES2_VERSION = 5f2f34163d1a7766fa5f6b701e47eed389ce360b
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
