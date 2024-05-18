################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on May 18, 2024
FHEROES2_VERSION = b16754d2088429c1b04dda7e80a0104a2c63a395
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
