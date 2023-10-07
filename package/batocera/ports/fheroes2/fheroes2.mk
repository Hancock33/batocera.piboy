################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Oct 07, 2023
FHEROES2_VERSION = 434f9a56f71967ee67799c3a682b05fa7fff5d83
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
