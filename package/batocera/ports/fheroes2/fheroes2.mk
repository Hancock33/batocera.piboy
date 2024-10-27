################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Oct 26, 2024
FHEROES2_VERSION = 8bd21155901edfdc2583be0ef8a96ee3080ff3a5
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
