################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Sept 17, 2023
FHEROES2_VERSION = 5f40d56c323bd76d798ceba326fc54fa2ca28707
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
