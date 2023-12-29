################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Dec 29, 2023
FHEROES2_VERSION = 7ed518e16a0e8641edc9ee45735b46d96a426117
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
