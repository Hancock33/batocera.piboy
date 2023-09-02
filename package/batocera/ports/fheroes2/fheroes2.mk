################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Sept 02, 2023
FHEROES2_VERSION = 8cddfd6bcbcd7ccf9dcb58a11e9465afa2e0db7e
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
