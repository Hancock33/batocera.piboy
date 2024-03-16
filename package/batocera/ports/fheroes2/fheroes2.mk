################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Mar 16, 2024
FHEROES2_VERSION = 8dc1c486422c353350308816ba61a4fae8d5ad7a
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
