################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Oct 24, 2023
FHEROES2_VERSION = 569490e8d1bd42900b1c6fe51c233e91617c1051
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
