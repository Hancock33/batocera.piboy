################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Oct 30, 2024
FHEROES2_VERSION = ea1ac0f19eb8e9a10fa7e32bec3801e8ef78a280
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
