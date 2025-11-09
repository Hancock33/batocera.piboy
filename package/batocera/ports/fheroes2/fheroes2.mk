################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Nov 09, 2025
FHEROES2_VERSION = 1.1.12
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
