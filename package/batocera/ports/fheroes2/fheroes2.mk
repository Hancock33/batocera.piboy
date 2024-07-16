################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Jul 14, 2024
FHEROES2_VERSION = b6693151e8108ecf1b15c4e686ad704036e90b4f
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
