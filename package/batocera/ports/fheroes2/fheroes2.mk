################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Oct 19, 2024
FHEROES2_VERSION = 328a254fe9af91d781121d7654f1cae8b1d6cdd1
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
