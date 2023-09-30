################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Sept 30, 2023
FHEROES2_VERSION = f71ce3d60dae82e1c64f67ef63a67c42f4d255d2
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
