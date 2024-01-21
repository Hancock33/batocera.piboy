################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Jan 21, 2024
FHEROES2_VERSION = b1d1e7c82e5b5da4826fe4d53c84954339ddc714
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
