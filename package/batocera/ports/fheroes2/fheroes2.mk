################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on May 03, 2024
FHEROES2_VERSION = 6e54f7dc518379eaaffc9a2c64df46b0661a060d
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
