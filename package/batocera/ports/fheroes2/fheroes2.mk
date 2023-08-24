################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Aug 24, 2023
FHEROES2_VERSION = e35d9407e4492584316bdca53a26ee3427b37c19
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
