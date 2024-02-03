################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Feb 03, 2024
FHEROES2_VERSION = 42b90e0754b1f65cfa876c1d439deb316248bfe4
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
