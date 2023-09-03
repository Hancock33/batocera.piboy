################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Sept 03, 2023
FHEROES2_VERSION = 117839baa6554684d360088f1e80442fc6561084
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
