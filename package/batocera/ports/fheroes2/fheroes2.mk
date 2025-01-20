################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Dec 30, 2024
FHEROES2_VERSION = 1.1.5
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
