################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Jun 30, 2024
FHEROES2_VERSION = 7b3af9a7864b7e8886a079b562110f4b27a20e8f
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
