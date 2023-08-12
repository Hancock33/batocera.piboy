################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Aug 12, 2023
FHEROES2_VERSION = eab5e2ee9736bca8fd5ed559dde25a36fa77a390
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
