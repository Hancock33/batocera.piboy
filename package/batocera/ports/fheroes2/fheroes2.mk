################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Jan 20, 2024
FHEROES2_VERSION = f8b61a135647fd3cd7a46b1a1e509d26a901c017
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
