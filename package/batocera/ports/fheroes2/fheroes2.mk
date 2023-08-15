################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Aug 15, 2023
FHEROES2_VERSION = eb7a4cf7025165e153399a8e372a17ddd07c15d2
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
