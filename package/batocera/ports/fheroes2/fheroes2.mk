################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Nov 18, 2024
FHEROES2_VERSION = ff3337ca5722e73b85d29d19af5987af731e8336
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
