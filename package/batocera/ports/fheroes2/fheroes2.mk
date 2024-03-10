################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Mar 10, 2024
FHEROES2_VERSION = 1f67370f5661961a1ea582916fdef37e532b761f
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
