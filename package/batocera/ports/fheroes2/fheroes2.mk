################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Sept 06, 2023
FHEROES2_VERSION = b140376817b9c2b3f9acd82b9e8e18b34374e13e
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
