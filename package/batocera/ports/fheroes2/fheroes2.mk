################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Apr 06, 2024
FHEROES2_VERSION = f97fd39285cb11aaa8af93749b2730d41490f484
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
