################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Sept 16, 2023
FHEROES2_VERSION = 6c040c79a6056fabe8d974477ebd115070eab443
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
