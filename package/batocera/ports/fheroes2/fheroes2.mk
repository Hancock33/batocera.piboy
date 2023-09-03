################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Sept 03, 2023
FHEROES2_VERSION = 0d92107c7f06c200afef764d2e43bef2c11f81ad
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
