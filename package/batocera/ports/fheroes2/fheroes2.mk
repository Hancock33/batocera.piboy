################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Sept 26, 2023
FHEROES2_VERSION = 94a4b6ef544d4161192c48d70616354107c5d72f
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
