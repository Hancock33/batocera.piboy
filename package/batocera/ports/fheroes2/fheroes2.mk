################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Jun 16, 2024
FHEROES2_VERSION = f4be294f578ac943eba9336715f01433048ecdc5
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
