################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Jun 15, 2024
FHEROES2_VERSION = 4e9bbdd5942be79ead7b79e5bdbe95c2ca67c9e9
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
