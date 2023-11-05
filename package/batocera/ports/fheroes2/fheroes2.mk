################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Nov 05, 2023
FHEROES2_VERSION = d9692f26567917a54e3caa2a7ae0a8b85331b5c9
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
