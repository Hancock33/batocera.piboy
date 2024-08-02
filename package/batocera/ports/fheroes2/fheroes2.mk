################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Aug 02, 2024
FHEROES2_VERSION = 2322d4cff845546288a6f7b79029ec4817ee5628
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
