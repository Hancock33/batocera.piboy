################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Nov 24, 2024
FHEROES2_VERSION = 69809bda608da2600b146f169251b7c949f44c4e
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
