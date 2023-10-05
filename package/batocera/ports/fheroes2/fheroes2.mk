################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Oct 05, 2023
FHEROES2_VERSION = 6d1e10372c7b9e44beacd42a449958858b6be2a3
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
