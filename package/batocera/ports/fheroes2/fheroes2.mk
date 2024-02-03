################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Feb 03, 2024
FHEROES2_VERSION = 3e093673745924c292574364da7d1f8ff8e7a875
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
