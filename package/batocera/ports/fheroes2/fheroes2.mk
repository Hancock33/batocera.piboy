################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Jun 10, 2024
FHEROES2_VERSION = 3a85f74e4f11c2efd2abb7117e8b53964f4f5c88
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
