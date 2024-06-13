################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Jun 13, 2024
FHEROES2_VERSION = 89bc20fecb0c6f6fc7758cb21e554f31d0977154
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
