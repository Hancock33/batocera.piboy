################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Jun 26, 2024
FHEROES2_VERSION = 8d733a8dfddaeb1b1a338ded4a7ed60f821c73f0
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
