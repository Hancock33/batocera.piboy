################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Jan 03, 2024
FHEROES2_VERSION = bea1f546cf97a9c6fc361c379ce32b47276ac121
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
