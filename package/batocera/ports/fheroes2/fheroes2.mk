################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Aug 19, 2023
FHEROES2_VERSION = ccede127d8d89c8a7d238584e8c427238b1afc9b
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
