################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Sept 30, 2024
FHEROES2_VERSION = 8c856d33c2ff168fcbccdd165a9a274207a7376c
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
