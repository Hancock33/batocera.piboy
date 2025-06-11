################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Jun 11, 2025
FHEROES2_VERSION = 1.1.9
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
