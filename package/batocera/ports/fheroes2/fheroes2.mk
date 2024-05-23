################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on May 23, 2024
FHEROES2_VERSION = e3093d284b7ceaaab885bdef0696dbf1b21aa271
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
