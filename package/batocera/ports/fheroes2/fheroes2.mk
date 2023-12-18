################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Dec 18, 2023
FHEROES2_VERSION = c2521c91e25da248c02456cdebf3155a5a15d573
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
