################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Dec 26, 2023
FHEROES2_VERSION = c9949d42c68bcd36b81d932243ac748938a58705
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
