################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Jul 07, 2024
FHEROES2_VERSION = d9efb109af414fcb6f22285c86493561ab7e5b99
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
