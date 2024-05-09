################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on May 09, 2024
FHEROES2_VERSION = ece1bfa9daaf05dc7494b63d9191c0b6c0408939
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
