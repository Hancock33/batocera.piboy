################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Aug 17, 2024
FHEROES2_VERSION = 0b7700f185201de217ed87d3be9de5124f142399
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
