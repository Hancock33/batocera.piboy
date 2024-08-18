################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Aug 18, 2024
FHEROES2_VERSION = 929e9b9cf37472f2031f6468b63f8e78d38dad25
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
