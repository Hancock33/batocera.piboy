################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on May 11, 2024
FHEROES2_VERSION = a3069d58bd48c9bf0ccd1c2e9a35912ae9d79492
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
