################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Mar 24, 2024
FHEROES2_VERSION = 2d5fe2d44fc48ee0f7db24dd7a30b6abfbd14c7e
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
