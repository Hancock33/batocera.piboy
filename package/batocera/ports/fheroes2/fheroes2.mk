################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Oct 23, 2024
FHEROES2_VERSION = bd1b4463f8eb34cc8e0a1038d01ef1576a49f155
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
