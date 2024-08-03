################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Aug 03, 2024
FHEROES2_VERSION = 8df5b989c3c16de557a5ac4f7ec95fdfb34db1a3
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
