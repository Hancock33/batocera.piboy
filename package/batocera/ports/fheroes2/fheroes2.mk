################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Aug 26, 2023
FHEROES2_VERSION = 541330789abc541d81ce52a3e69da974e6424898
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
