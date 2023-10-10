################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Oct 10, 2023
FHEROES2_VERSION = 0f845e08885c9269cb6cf2c5bfc55533ed987f0c
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
