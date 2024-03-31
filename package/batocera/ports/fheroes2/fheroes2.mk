################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Mar 31, 2024
FHEROES2_VERSION = 92a344b701256741e6f403ae4a2a266aa847a09e
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
