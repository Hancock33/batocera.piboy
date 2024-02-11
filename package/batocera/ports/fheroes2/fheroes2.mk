################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Feb 11, 2024
FHEROES2_VERSION = 59fd8c13c77e6817744498942f4d37640b37d114
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
