################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Aug 25, 2023
FHEROES2_VERSION = 8e52bf2ff1932f54c65626e7c0f2973ef14fc86c
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
