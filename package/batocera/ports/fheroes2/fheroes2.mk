################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Jan 06, 2024
FHEROES2_VERSION = 92b39d82d9fcd998a8775acdcc919a4973d03c5f
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
