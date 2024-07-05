################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Jul 05, 2024
FHEROES2_VERSION = 52a5dab2c59becfb5f8d6001f7a6f991d8c6c8ae
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
