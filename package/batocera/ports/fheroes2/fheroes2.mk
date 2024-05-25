################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on May 25, 2024
FHEROES2_VERSION = f6ffbce43189d5a70aca86276320cc1d268e9527
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
