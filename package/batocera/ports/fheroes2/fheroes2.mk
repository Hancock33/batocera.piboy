################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Nov 20, 2024
FHEROES2_VERSION = 4e66104128e6fc20c820a5332d8d6053b239f178
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
