################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Mar 02, 2024
FHEROES2_VERSION = 45a24a3fe745d0ac296834ce044d9179afa6927b
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
