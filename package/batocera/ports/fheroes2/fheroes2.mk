################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Aug 29, 2024
FHEROES2_VERSION = 8bd45dabec8ceb44f2d4a1e1d2a782caca9d8423
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
