################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Sept 27, 2023
FHEROES2_VERSION = ae6a554b766ebf750ad40e47e4977b0fca3e51e7
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
