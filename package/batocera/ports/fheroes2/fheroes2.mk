################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Oct 10, 2024
FHEROES2_VERSION = 21d3c22e4ad796927f6a2a6a9736c75e46b895c3
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
