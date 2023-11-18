################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Nov 18, 2023
FHEROES2_VERSION = d44317535853842f319fbc651a1008c2fa9de20f
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
