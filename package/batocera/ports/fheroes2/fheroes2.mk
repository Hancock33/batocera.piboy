################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Dec 29, 2023
FHEROES2_VERSION = ba466a7cefc493b8d830bff59ab6a221f6f6c3b0
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
