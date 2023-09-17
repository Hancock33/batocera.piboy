################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Sept 17, 2023
FHEROES2_VERSION = 73f79c7dabe672a16b9f9670b41029ecd069902b
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
