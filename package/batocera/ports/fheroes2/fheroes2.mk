################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Sept 01, 2023
FHEROES2_VERSION = 7dd15ae387e47d18edbf3377db4300c00d2d8016
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
