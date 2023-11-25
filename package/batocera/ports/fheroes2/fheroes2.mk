################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Nov 25, 2023
FHEROES2_VERSION = 57a9852f45ae5e030bc5d3549b5d08c6fe5cf22f
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
