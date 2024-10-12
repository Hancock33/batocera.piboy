################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Oct 12, 2024
FHEROES2_VERSION = 5ece730148d0cc84a78b5e0d049122f14e08a52a
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
