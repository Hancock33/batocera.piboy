################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Jun 03, 2024
FHEROES2_VERSION = 372c7879121a9795276f541d3f3beb3e342650e6
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
