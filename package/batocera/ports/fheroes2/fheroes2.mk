################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on May 10, 2024
FHEROES2_VERSION = 08de7c2399176fd00d2b6f6c34611d08a9b0ade6
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
