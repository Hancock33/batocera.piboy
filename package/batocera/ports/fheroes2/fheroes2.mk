################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Oct 26, 2024
FHEROES2_VERSION = 9e7a5a17b6cc6325c43433f4a7d03c8feeb062fe
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
