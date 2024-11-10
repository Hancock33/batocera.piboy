################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Nov 06, 2024
FHEROES2_VERSION = 9cf0e68721acf09dbedc26f3ab121365f6f5bf64
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
