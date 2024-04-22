################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Apr 21, 2024
FHEROES2_VERSION = bcbf85af7bb0fa1d79627a063c18d488a6b9f6c3
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
