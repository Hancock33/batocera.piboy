################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Nov 05, 2023
FHEROES2_VERSION = 361a18fa64e8ca85e6f4264eafd44c7876dd7067
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
