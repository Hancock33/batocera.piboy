################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Jun 02, 2024
FHEROES2_VERSION = ea4b0bcd7a15e20d9d071682c2b6520321e6c348
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
