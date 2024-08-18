################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Aug 18, 2024
FHEROES2_VERSION = 9585796f59e991551db20e4d0cba504f63afa4e0
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
