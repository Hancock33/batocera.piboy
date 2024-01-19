################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Jan 19, 2024
FHEROES2_VERSION = b74cbc2c3bf1904a0a95e6f09553d78c66c6130a
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
