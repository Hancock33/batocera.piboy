################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Apr 08, 2024
FHEROES2_VERSION = e4ad927699f4d5db75c3b4ba3fe2cfb6500c9b8b
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
