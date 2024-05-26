################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on May 25, 2024
FHEROES2_VERSION = 92237f0d12c5552736b1850330b76176ee576070
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
