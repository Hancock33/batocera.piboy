################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on May 17, 2024
FHEROES2_VERSION = d097964cb9af66ebf744eff25f0046a67853b1a3
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
