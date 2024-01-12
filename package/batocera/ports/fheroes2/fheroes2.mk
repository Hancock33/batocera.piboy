################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Jan 12, 2024
FHEROES2_VERSION = bb7700de93386a177f2215fc231a62a400f6a664
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
