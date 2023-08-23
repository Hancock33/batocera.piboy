################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Aug 23, 2023
FHEROES2_VERSION = 76ec8e2bb5a26e8a3396cb929f2b602e8ff64869
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
