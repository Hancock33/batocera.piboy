################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Oct 21, 2023
FHEROES2_VERSION = 749507c3fde5c33850aac079ed575cf5d7c807c5
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
