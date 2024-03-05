################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Mar 05, 2024
FHEROES2_VERSION = 1feaacf5856061a3fee827058145e6f04b08fccc
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
