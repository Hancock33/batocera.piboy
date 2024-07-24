################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Jul 24, 2024
FHEROES2_VERSION = de449013d17c8e06086fcb32ab16f21dd66ac556
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
