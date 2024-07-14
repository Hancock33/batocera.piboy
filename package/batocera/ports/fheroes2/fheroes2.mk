################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Jul 14, 2024
FHEROES2_VERSION = 70e59d3053e38757fab44a463cf4086616e4ca9a
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
