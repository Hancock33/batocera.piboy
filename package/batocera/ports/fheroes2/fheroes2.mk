################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Oct 13, 2024
FHEROES2_VERSION = 3eef0d3f1a956fa4d796d9140a521e364638bcec
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
