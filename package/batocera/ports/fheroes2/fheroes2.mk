################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on May 19, 2024
FHEROES2_VERSION = 82a1a962e503051e0cdc426226d02d8ea812dbab
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
