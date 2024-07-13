################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Jul 13, 2024
FHEROES2_VERSION = 1d5f63004feed9aebbad8f8d354da093511e859f
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
