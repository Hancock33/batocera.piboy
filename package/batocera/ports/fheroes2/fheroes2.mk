################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Mar 21, 2024
FHEROES2_VERSION = 54620793cf70e3ed7504776e4653965b583dd619
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
