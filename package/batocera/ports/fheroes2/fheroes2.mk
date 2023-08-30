################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Aug 30, 2023
FHEROES2_VERSION = e033592cbca0d19fad4ca0ee4cc9059aa29c5576
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
