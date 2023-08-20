################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Aug 20, 2023
FHEROES2_VERSION = 72df201c726016f9826d1be72bc322a0ac3f0d46
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
