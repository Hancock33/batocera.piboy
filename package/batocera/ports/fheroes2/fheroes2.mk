################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Feb 09, 2024
FHEROES2_VERSION = 93d845305c3b134e21cacc1782222a3232966fac
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
