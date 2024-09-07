################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Sept 07, 2024
FHEROES2_VERSION = 2f3f157da34a1306d531b69917600f71ab9b8963
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
