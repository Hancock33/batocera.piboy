################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Jul 14, 2024
FHEROES2_VERSION = 50d1181471d9e2654e8a7340a852d1ef43547d9c
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
