################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Mar 17, 2024
FHEROES2_VERSION = 3ababf079c75b912485d2a1d7d18198dad8216e4
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
