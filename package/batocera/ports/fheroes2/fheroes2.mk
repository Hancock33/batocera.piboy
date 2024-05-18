################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on May 18, 2024
FHEROES2_VERSION = ebf07a476fb799511825a997245b865bc1c3fc8a
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
