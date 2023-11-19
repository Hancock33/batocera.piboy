################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Nov 19, 2023
FHEROES2_VERSION = a4d40c8717a8a1c75cf661a89cb0fe86f5a44316
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
