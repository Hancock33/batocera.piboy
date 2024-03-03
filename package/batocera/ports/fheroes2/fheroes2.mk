################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Mar 03, 2024
FHEROES2_VERSION = 0751aeb6441dd85d3c5f73b316714369d8516324
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
