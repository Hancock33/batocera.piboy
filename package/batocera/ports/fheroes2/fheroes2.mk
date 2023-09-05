################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Sept 05, 2023
FHEROES2_VERSION = 220067fefa89f78684c6a4b306481fbc627d2534
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
