################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Sept 22, 2024
FHEROES2_VERSION = dc939681ad7cbd8d1d5d6314d978fb97c9ab4fe0
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
