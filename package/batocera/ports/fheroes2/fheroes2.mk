################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Apr 21, 2024
FHEROES2_VERSION = 1c0de32cd9ed8c43f10f53c358fa5618d24dc086
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
