################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Mar 31, 2024
FHEROES2_VERSION = a237508db9d491c914d30e488a5bf8def221e92f
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
