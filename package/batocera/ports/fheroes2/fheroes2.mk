################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Jun 23, 2024
FHEROES2_VERSION = 3016209622aa892100dee803fa7038ed500ebdd2
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
