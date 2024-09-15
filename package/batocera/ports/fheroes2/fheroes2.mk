################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Sept 15, 2024
FHEROES2_VERSION = 1f27ed9b07980c2366a7365d0e380f823fe18903
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
