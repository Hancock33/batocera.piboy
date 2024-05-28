################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on May 28, 2024
FHEROES2_VERSION = e6c04180643d5dc1db19f13ace9896eff7bac936
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
