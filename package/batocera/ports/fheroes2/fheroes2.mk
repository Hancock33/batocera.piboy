################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Nov 15, 2023
FHEROES2_VERSION = b5df30887307a2d925668d00bd2930aa049175bf
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
