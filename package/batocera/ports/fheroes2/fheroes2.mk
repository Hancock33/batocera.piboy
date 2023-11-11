################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Nov 11, 2023
FHEROES2_VERSION = 1febc23b5158367d9605ca7fd507974cdc0cd722
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
