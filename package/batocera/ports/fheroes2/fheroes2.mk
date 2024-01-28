################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Jan 27, 2024
FHEROES2_VERSION = 69e62387420d546a09063f8b3a50cb0d2a456057
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
