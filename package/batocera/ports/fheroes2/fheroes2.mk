################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Jan 10, 2024
FHEROES2_VERSION = 96666ae98f2e5a52816cadaa0b784b4e02a20e82
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
