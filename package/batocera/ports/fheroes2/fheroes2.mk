################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Oct 27, 2023
FHEROES2_VERSION = 34de5f799a3d850e47b15ef1709c64686d8b69dc
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
