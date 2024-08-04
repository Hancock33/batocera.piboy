################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Aug 04, 2024
FHEROES2_VERSION = 5a63b85b4c165fe11eeff575b2cc8ec474e0a4eb
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
