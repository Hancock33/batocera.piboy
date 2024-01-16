################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Jan 16, 2024
FHEROES2_VERSION = 208bf6bf038ad94a95e8ab0c5285b05811296d12
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
