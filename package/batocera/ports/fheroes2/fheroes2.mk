################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Oct 18, 2024
FHEROES2_VERSION = fcd24e9ce6bce35e3bd07e359182b27cf6ec0c2f
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
