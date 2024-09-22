################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Sept 22, 2024
FHEROES2_VERSION = cb6ce149c8966b796631e3056ae7bc160f8d3765
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
