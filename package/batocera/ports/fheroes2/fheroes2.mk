################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Oct 21, 2023
FHEROES2_VERSION = a147e60f738b1806bd8733ef86521352fe66b9c2
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
