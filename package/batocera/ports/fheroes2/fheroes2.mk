################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on May 14, 2024
FHEROES2_VERSION = d4cf5ef322a7595aea9138e317e9fee02f9e9c27
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
