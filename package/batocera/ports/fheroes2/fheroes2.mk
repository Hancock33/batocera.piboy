################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Jan 20, 2024
FHEROES2_VERSION = 99f3580ca3523a1c9bc34610f94052bd5115c24b
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
