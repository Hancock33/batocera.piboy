################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Jul 06, 2024
FHEROES2_VERSION = 6d57e03d9199be0fa50e63bc41c68e066694ba3f
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
