################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Sept 29, 2024
FHEROES2_VERSION = 04ea05b844cb1642fc3dbf1b8f3260d124a76263
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
