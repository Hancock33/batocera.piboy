################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Dec 15, 2023
FHEROES2_VERSION = 74403d052911f0441e316d36200c8ccd84e75afe
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
