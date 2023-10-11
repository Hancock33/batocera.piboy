################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Oct 11, 2023
FHEROES2_VERSION = 2dc00d254b5ded19133136ec67a9c20d418cb580
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
