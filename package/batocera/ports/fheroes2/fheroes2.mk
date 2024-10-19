################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Oct 19, 2024
FHEROES2_VERSION = 55e7ec0a08ed33e83d7d618a3161d2f3cfa19e11
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
