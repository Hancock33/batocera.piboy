################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on May 30, 2024
FHEROES2_VERSION = b90ad091f2880308801d151113277b2168f31d21
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
