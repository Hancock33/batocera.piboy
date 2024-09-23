################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Sept 23, 2024
FHEROES2_VERSION = 5e303b58c07d59b005fe7b1ac3c8ba1fb273c954
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
