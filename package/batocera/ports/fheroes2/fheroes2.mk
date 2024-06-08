################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Jun 08, 2024
FHEROES2_VERSION = 2d37ea22e2b6216c3bb6044dfab98cf1015b20dc
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
