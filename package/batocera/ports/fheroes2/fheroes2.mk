################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Feb 07, 2024
FHEROES2_VERSION = 523cf9ba6d9236a317487defdc5f18e5cc3f7074
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
