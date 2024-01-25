################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Jan 25, 2024
FHEROES2_VERSION = 3bfc40c8a9d1c3534b22b2a20da034c2aaacd821
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
