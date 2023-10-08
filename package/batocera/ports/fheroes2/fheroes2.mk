################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Oct 08, 2023
FHEROES2_VERSION = c2fe312381caa23dc36c13c677a3296269937182
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
