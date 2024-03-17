################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Mar 17, 2024
FHEROES2_VERSION = 3c599d12c08cc8bdf65917c0afce0276a5ac630d
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
