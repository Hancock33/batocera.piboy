################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on May 17, 2024
FHEROES2_VERSION = 449e0b23e71157fab866442bce907fbb75d71062
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
