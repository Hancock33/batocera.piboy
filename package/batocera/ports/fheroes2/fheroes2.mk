################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Jul 19, 2024
FHEROES2_VERSION = efc8eb5cd6176f37b54f73a641f0975cf6079285
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
