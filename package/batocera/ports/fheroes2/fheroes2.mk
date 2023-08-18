################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Aug 18, 2023
FHEROES2_VERSION = 625eddd90deea828a38d78ebea28605a500f6139
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
