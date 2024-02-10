################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Feb 10, 2024
FHEROES2_VERSION = b8ee83d4dd87c99b6f8220be4ef5febde67d85cf
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
