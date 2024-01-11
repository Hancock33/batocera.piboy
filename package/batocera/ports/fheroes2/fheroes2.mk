################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Jan 11, 2024
FHEROES2_VERSION = 5dd57dee139410770efb19b01dedf19f4bbb3105
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
