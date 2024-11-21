################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Nov 21, 2024
FHEROES2_VERSION = f3c09ccb5d0579cddf9ab61ec1a043a80f795709
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
