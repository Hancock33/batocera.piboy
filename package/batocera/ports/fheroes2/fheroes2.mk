################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Nov 04, 2023
FHEROES2_VERSION = 6c1511c7c3660560467451bca606d92b78cf9bc7
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
