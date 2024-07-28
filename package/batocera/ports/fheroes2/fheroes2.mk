################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Jul 27, 2024
FHEROES2_VERSION = 1504b8a3eb7e5a5997830fa2a1d10c269a1520e0
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
