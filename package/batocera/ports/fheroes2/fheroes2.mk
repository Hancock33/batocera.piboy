################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Aug 23, 2023
FHEROES2_VERSION = a9f44eeedad0e2a0177028b07c96c81d46f31958
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
