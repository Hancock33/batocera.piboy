################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Oct 17, 2023
FHEROES2_VERSION = aea5f393861f889324827f3cf6ef78006af7b33c
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
