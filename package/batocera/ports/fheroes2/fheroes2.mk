################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Nov 14, 2023
FHEROES2_VERSION = 224bc71c1740bc26a20c74c67201d70716298a4e
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
