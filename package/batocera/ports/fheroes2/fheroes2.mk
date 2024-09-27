################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Sept 27, 2024
FHEROES2_VERSION = f735370f3a753f150cca931dae71d8bca0d93ef9
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
