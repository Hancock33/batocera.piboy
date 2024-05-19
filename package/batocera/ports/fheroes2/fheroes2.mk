################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on May 19, 2024
FHEROES2_VERSION = 3df0382139014dd4b22814e679880dacedf25675
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
