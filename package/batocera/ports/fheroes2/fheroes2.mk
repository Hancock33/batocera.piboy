################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Apr 07, 2024
FHEROES2_VERSION = e1ff9fc897f55f3525c1766ace1f9277c44eb973
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
