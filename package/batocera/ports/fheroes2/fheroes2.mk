################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Mar 23, 2024
FHEROES2_VERSION = 1c0f340b8a3629a5b34e162ae0cd24fdedb1641b
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
