################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Sept 10, 2023
FHEROES2_VERSION = 5b8cdd3152a1953214dc9a5bb87018caf5f0ac15
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
