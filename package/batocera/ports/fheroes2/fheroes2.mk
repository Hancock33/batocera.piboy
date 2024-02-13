################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Feb 13, 2024
FHEROES2_VERSION = f8698887f10a475dcfd042ecf58e7b463daa37c1
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
