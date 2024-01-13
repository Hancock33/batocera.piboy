################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Jan 13, 2024
FHEROES2_VERSION = 597cef9522b03c77b55078279615ddcab211bf4a
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
