################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Sept 16, 2024
FHEROES2_VERSION = 7cc10d3043e4ee2500399dc0e557a0f4a9a16c5e
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
