################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Dec 27, 2023
FHEROES2_VERSION = 05171cfe671dfb2d205eb7345e4b7d183721954a
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
