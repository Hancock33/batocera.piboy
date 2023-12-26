################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Dec 26, 2023
FHEROES2_VERSION = c15567800793b77e4a4b39dbb30d774b428308e6
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
