################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Oct 24, 2024
FHEROES2_VERSION = 104220241d1266432399f55696243c77681a96d3
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
