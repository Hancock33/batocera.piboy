################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Mar 11, 2024
FHEROES2_VERSION = cfb72208a33c732771539a6133ea58dc952c9d65
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
