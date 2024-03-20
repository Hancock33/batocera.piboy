################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Mar 20, 2024
FHEROES2_VERSION = 49cb818e22227717f5d9ff396e7abaad42a1500a
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
