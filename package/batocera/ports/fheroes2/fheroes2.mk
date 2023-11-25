################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Nov 25, 2023
FHEROES2_VERSION = 47d32f9e154479e94fc2a7a9f8fcd1a14859897a
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
