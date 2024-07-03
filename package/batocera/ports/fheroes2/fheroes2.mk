################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Jul 03, 2024
FHEROES2_VERSION = 914b70e4dfdff49bc7fb6cb498654a22f9aa4f67
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
