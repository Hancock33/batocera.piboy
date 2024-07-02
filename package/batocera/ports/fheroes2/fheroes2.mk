################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Jul 02, 2024
FHEROES2_VERSION = dcc69190a878775cbc7edcb9c6a9f2974158ad88
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
