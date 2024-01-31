################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Jan 31, 2024
FHEROES2_VERSION = 09be9ddca666a9384716ee156f2288a12999568f
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
