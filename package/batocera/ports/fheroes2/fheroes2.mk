################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Dec 30, 2023
FHEROES2_VERSION = 24d1a81b9c97e4bece15b46e843bcbe55dfef9a9
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
