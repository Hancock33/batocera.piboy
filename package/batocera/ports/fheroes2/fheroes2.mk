################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Feb 09, 2024
FHEROES2_VERSION = d5ea6874c761343e9ed6ac49871fc49c43da3675
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
