################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on May 03, 2025
FHEROES2_VERSION = 1.1.8
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
