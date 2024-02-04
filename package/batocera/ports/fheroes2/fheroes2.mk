################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Feb 04, 2024
FHEROES2_VERSION = 60b94d8046978621bf5c841ea8bb8ba9b1a8a030
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
