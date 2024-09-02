################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Sept 02, 2024
FHEROES2_VERSION = 8dffd855e7ab7411eedb566ab0e9b3bf67705992
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
