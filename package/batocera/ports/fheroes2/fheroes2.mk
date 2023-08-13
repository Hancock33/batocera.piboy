################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Aug 13, 2023
FHEROES2_VERSION = 708ed576430f6563a0465e6f962001fc9d6b4cd5
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
