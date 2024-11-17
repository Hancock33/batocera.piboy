################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Nov 17, 2024
FHEROES2_VERSION = 763361dad4c700512067568a634cefb1fa9c4cb7
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
