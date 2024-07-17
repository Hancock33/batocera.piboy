################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Jul 17, 2024
FHEROES2_VERSION = 0b8d3403a0eb46adaee3ad49a4a1771d7b07042f
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
