################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Jun 05, 2024
FHEROES2_VERSION = 9800de42e9624660e0fd0e207744bf61e3bd659c
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
