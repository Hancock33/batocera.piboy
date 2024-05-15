################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on May 15, 2024
FHEROES2_VERSION = a328c581dcce0bb9d67301dbc095c70c759e3df7
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
