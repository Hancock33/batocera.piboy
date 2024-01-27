################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Jan 26, 2024
FHEROES2_VERSION = 79d53bee02426972539527c5292ee5d7637900ce
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
