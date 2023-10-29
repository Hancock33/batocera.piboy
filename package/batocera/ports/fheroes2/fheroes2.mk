################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Oct 29, 2023
FHEROES2_VERSION = 73ea4648df14806b5f722be31d1c994da6cb3441
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
