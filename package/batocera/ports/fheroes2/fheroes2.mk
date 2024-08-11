################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Aug 11, 2024
FHEROES2_VERSION = 8185a657a708646a185cf22cf22d87fabd7417da
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
