################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Sept 26, 2024
FHEROES2_VERSION = fc32dbb1f17d9ae1d72dddb131bd4909579c582d
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
