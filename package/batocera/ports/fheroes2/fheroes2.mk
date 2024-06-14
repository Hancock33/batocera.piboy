################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Jun 14, 2024
FHEROES2_VERSION = acf285ff0a5870cf9820db9043cd2f156d3ecc99
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
