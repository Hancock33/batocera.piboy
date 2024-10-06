################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Oct 05, 2024
FHEROES2_VERSION = 14393957d46c24db2d0a8feb47020eeed82c6a0e
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
