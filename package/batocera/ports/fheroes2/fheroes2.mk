################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Jul 20, 2025
FHEROES2_VERSION = 1.1.10
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
