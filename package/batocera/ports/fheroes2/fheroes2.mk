################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on May 01, 2024
FHEROES2_VERSION = 90273b160dea0a4ecd8160a888e545efd5265589
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
