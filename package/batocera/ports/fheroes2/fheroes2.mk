################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Mar 10, 2024
FHEROES2_VERSION = cdf61f06f02d0e3513abf4bd27e09bbf45d3d280
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
