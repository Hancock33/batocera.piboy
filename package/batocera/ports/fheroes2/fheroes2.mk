################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Sept 20, 2023
FHEROES2_VERSION = c1dba012e0d9ee3681773c754f645c951346edd6
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
