################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Aug 11, 2023
FHEROES2_VERSION = 7cb36365bd82f5419e6c0eeba2e4e4d38dbef5f4
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
