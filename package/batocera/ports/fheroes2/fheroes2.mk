################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Dec 25, 2023
FHEROES2_VERSION = 945f5009b878583e00d487fcec30ce36de33e406
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
