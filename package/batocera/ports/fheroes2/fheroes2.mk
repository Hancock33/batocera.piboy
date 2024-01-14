################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Jan 14, 2024
FHEROES2_VERSION = 618cfd9c3aa9c8a4748d0f625e4d274a5cd00f42
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
