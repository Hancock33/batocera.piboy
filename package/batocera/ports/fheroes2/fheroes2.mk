################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Nov 17, 2024
FHEROES2_VERSION = b1b5357089598d4039d7a0a97e1004cce7b11049
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
