################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Oct 20, 2023
FHEROES2_VERSION = 24c8a723bd2f2850b2606acd57eb4f66545146b5
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
