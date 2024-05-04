################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on May 04, 2024
FHEROES2_VERSION = d979712b60427b80f25959b9cb482a5c8f1e98cb
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
