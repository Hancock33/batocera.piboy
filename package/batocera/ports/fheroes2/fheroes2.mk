################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Jan 20, 2024
FHEROES2_VERSION = e7f0a4d8d138935d08ea81eee9dd4aa7894d319f
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
