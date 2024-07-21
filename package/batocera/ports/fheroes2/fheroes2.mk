################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Jul 21, 2024
FHEROES2_VERSION = e35f33c9595437e5ce600bf8b476edb2e94c1c99
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
