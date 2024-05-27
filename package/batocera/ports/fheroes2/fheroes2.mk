################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on May 27, 2024
FHEROES2_VERSION = 22af9350922a204a3d826b6e07d597f5c2e50b41
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
