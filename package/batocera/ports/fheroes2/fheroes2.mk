################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Sept 24, 2023
FHEROES2_VERSION = cee6d0fd2cf32c058eeb24e072e53a0ae0262cfc
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
