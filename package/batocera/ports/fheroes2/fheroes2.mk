################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Feb 11, 2024
FHEROES2_VERSION = 86924737ad59de04643955e34b2d02c684528137
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
