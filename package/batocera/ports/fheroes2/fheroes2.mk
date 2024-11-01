################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Nov 01, 2024
FHEROES2_VERSION = 0ef7526ed6a24662e78b31fd0d21df2568ff9d66
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
