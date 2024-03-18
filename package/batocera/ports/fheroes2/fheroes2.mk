################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Mar 18, 2024
FHEROES2_VERSION = 93cccfbdd0fae98ddfad3c95698451c4a556b521
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
