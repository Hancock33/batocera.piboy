################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Oct 13, 2024
FHEROES2_VERSION = 48901a96d1b9eac277b61b5fef1be9b26f456858
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
