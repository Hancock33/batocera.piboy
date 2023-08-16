################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Aug 16, 2023
FHEROES2_VERSION = 4892c6532c56cfddf21e57a75d77f75342dc78f8
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
