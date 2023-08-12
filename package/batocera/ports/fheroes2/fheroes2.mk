################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Aug 12, 2023
FHEROES2_VERSION = cbb8594829cb7c302218342152c6230dd19689c7
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
