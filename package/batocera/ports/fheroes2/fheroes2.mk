################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Mar 07, 2024
FHEROES2_VERSION = f4c38b855f8e70ea01f64d2622bb60580ccce63a
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
