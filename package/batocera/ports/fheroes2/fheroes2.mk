################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on May 16, 2024
FHEROES2_VERSION = 664c4a751a28448f4dec9ffeed6445902e5c1603
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
