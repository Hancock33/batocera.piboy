################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Jul 08, 2024
FHEROES2_VERSION = e7c3cfa27e4b206adb0fc69c2741e83760673a0f
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
