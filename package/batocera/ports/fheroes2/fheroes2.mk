################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Dec 06, 2023
FHEROES2_VERSION = fba544d578117054e3ee7ce9ee395b4572825176
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
