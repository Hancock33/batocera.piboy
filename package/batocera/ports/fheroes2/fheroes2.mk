################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Jun 17, 2024
FHEROES2_VERSION = bc5da3a006577dea079360967ac57cba076fd73d
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
