################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Dec 31, 2023
FHEROES2_VERSION = e769a5552e42bd8dd6c8c76c2fc1fbec3a03c04c
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
