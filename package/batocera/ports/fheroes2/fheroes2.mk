################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Dec 02, 2023
FHEROES2_VERSION = 0981ead3839128c4c77f41d12fca5a3addb0997c
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
