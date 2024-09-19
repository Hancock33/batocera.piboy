################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Sept 19, 2024
FHEROES2_VERSION = b87f62aed815c86862d3b45e804e5b88a2dd1a3d
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
