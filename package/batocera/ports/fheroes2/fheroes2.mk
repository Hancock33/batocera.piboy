################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Nov 16, 2024
FHEROES2_VERSION = e070c07a23347d9797ecf3e9a9f94995edde9d8e
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
