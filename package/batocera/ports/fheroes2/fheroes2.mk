################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Mar 23, 2024
FHEROES2_VERSION = c410aaa2d4c4bcea3b0347b5ac28323da98e7e84
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
