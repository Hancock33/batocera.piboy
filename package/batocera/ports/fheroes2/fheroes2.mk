################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Nov 24, 2023
FHEROES2_VERSION = 0e5ae6f1478797261ddfa5c47abfad4cadcfd6d3
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
