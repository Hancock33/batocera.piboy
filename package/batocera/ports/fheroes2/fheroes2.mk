################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Apr 11, 2024
FHEROES2_VERSION = a780c8b10ed34b1537592d60227e247c9777a0f4
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
