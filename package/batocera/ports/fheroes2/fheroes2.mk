################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Jan 05, 2024
FHEROES2_VERSION = 5dfd271c0fb41e00927252699abea36aba12aafb
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
