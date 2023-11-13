################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Nov 12, 2023
FHEROES2_VERSION = dbd6da894ceed1c87688e91031bfec75ceac2455
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
