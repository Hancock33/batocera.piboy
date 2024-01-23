################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Jan 23, 2024
FHEROES2_VERSION = d5ba9a252e629ff69a31f40f94b07ae20f15ea28
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
