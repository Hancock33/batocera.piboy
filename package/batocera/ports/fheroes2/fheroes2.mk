################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Sept 08, 2023
FHEROES2_VERSION = 3e6efc003eaeffc9fb051359baf0107d6145ac8c
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
