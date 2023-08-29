################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Aug 29, 2023
FHEROES2_VERSION = 8f9a058b76f6dbce084ade2829d1301c63d59f6f
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
