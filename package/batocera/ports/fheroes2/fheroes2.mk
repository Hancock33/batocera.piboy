################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Oct 20, 2024
FHEROES2_VERSION = 7b5a9a4d0f8965e0f69836198256034a408f69c9
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
