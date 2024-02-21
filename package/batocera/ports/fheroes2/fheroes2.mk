################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Feb 21, 2024
FHEROES2_VERSION = 6f69312e06d55a43d7b2c1885fb0cea93e972750
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
