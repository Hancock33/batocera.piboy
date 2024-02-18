################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Feb 18, 2024
FHEROES2_VERSION = 1385831f7d03b1c70058a39d61c0311cf32d2236
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
