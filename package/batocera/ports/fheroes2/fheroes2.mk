################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Mar 17, 2024
FHEROES2_VERSION = 45fc18f64357c99859f815eeed229f90874ce1c5
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
