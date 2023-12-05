################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Dec 05, 2023
FHEROES2_VERSION = 4e4a7ab239a7a75897bbd3b2c9a83a6c3844d240
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
