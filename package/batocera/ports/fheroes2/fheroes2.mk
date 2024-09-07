################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Sept 07, 2024
FHEROES2_VERSION = 5ff4f6146248e5057e2f40f119362e32b2f8b76d
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
