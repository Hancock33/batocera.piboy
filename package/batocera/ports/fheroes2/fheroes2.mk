################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Nov 09, 2023
FHEROES2_VERSION = 08d05334f348aa6d90c9ca0c1ae82957de35ad31
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
