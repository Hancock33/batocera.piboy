################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Jun 25, 2024
FHEROES2_VERSION = 65376a1fa79388066e88030090342831877fb3b9
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
