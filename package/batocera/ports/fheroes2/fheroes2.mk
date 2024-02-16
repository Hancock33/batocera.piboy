################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Feb 16, 2024
FHEROES2_VERSION = b70c9505e0321615950a6870b1a2af0c926a56a3
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
