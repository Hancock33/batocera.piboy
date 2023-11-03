################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Nov 03, 2023
FHEROES2_VERSION = adf7b02889c6a427e6a864e887112bf5ee0a5520
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
