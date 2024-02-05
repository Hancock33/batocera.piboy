################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Feb 05, 2024
FHEROES2_VERSION = 260f1ca19d6e7a8f193f1dc5e386eeada2a7b6b4
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
