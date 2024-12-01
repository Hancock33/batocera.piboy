################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Nov 27, 2024
FHEROES2_VERSION = 1.1.4
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
