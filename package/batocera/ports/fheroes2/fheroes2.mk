################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Oct 07, 2023
FHEROES2_VERSION = 0a08d0a92418fffc0556ea180d50733015982744
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
