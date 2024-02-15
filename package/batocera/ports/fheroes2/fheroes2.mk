################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Feb 15, 2024
FHEROES2_VERSION = 9ab2d3f31c0c83b9b04c28bc744117eaeba4cafd
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
