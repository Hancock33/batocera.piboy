################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Dec 10, 2023
FHEROES2_VERSION = 8a129b4cab373f390dfbdf1c5ce32f92e848abcf
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
