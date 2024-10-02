################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Oct 02, 2024
FHEROES2_VERSION = 8f9296e933a97dec19a04b52db09340a67a0b25f
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
