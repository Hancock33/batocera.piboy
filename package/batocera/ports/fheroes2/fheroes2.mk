################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Oct 12, 2023
FHEROES2_VERSION = b1532931edec695d653d1e8a4c7a13554f6f0dac
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
