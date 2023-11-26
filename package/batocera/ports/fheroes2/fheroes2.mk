################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Nov 26, 2023
FHEROES2_VERSION = db784d2be13bbc7e4c5d19d829e17350a47f8d8f
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
