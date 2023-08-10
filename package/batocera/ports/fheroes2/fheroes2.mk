################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Aug 10, 2023
FHEROES2_VERSION = 901cd9cfbe3cf18ee7152e987ee090f2f69b92c5
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
