################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Mar 27, 2024
FHEROES2_VERSION = 9436f7ea9b9fad309e820158ae95883a5f61126b
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
