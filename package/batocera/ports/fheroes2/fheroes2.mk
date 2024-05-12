################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on May 11, 2024
FHEROES2_VERSION = b8ee8d34d5570771cf465a2452b8b861754630df
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
