################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Apr 29, 2024
FHEROES2_VERSION = 135d1206a89d8adb67039fbd866c6f26f213f039
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
