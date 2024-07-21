################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Jul 21, 2024
FHEROES2_VERSION = 995e1fe3983d8fdd1d2de39fe7fdbe34920cddd8
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
