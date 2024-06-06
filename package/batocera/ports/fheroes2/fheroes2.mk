################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Jun 06, 2024
FHEROES2_VERSION = 54de91f1f1be58c4d99a26f79119aee67370eca1
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
