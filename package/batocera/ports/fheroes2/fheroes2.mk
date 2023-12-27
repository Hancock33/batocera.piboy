################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Dec 27, 2023
FHEROES2_VERSION = c0e6ce80d26e14c154c49c18bf946485f69e0a59
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
