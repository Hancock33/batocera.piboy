################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Aug 21, 2024
FHEROES2_VERSION = 5d8276ba5d244136e5f352046a4563966521abf3
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
