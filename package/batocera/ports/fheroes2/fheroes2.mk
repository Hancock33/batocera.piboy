################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on May 24, 2024
FHEROES2_VERSION = e6710229fce2092923594baa450bd6ce276bcba5
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
