################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Nov 27, 2024
FHEROES2_VERSION = 03980b4ababb9947d9579bee967b09e0e2ba7bc5
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
