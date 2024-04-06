################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Apr 06, 2024
FHEROES2_VERSION = 25417f7e192cdfb89404e6021179bd51e2f7afa5
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
