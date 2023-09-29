################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Sept 29, 2023
FHEROES2_VERSION = 9bb852eae0324f4bf29c142c22c341717f5cfb64
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
