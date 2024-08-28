################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Aug 27, 2024
FHEROES2_VERSION = 880f069b60f64e276cf69ecef546a98c6033b2ce
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
