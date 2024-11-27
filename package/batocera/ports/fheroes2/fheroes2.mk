################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Oct 23, 2024
FHEROES2_VERSION = 1.1.3
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
