################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Sept 27, 2024
FHEROES2_VERSION = c9086f3c736adffd4c8ac438cfefc0489854b8a5
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
