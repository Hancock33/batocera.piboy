################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Jun 28, 2024
FHEROES2_VERSION = 9846db43fa42899d09e2519dd15cbb55d779638f
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
