################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Dec 19, 2023
FHEROES2_VERSION = 7084547aac6546c859e60fb72592bb1ea3fec60b
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
