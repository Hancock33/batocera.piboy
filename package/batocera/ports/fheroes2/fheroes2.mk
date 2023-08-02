################################################################################
#
# Free Heroes (of Might and Magic) 2 engine
#
################################################################################
# Version: Commits on Aug 02, 2023
FHEROES2_VERSION = b3d3ad14dd1e3272050c81c45b33981a660f2031
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
