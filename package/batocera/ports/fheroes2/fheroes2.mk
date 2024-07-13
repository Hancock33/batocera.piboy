################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Jul 13, 2024
FHEROES2_VERSION = 88d00c9d1d9cd4868374e005661a9dd3c91ad5e0
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
