################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Mar 21, 2024
FHEROES2_VERSION = af207aafa9cf9744e403a1d4d140c178eb4b7bd1
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
