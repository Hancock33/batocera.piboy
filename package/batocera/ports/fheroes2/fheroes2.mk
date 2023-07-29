################################################################################
#
# Free Heroes (of Might and Magic) 2 engine
#
################################################################################
# Version: Commits on Jul 28, 2023
FHEROES2_VERSION = 1057dcb891be1eb6fb4cec2d3d452ac9e4856c87
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
