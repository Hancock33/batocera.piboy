################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Aug 17, 2024
FHEROES2_VERSION = 0b7e1868610a8382155544260116d4b39cd1d7c5
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
