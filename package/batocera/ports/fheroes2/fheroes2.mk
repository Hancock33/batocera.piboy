################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Jul 31, 2024
FHEROES2_VERSION = 6e5d73f096fc033086427142fb8c18913a5ead6c
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
