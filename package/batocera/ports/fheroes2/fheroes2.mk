################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on May 13, 2024
FHEROES2_VERSION = d69de15ac8633d910895082495db37558e6083aa
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
