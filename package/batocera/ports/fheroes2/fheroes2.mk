################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Nov 10, 2023
FHEROES2_VERSION = 86b486019059e1855b6c18c996ca723fe6686d00
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
