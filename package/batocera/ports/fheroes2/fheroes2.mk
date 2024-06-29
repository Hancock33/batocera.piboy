################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Jun 29, 2024
FHEROES2_VERSION = 84dbbca7e9a562fb4c0ba1c7df4846151435c894
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
