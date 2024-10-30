################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Oct 30, 2024
FHEROES2_VERSION = 3db3e0a830d79cc0d8ff3840c4aa15bf79d487e5
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
