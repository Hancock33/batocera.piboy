################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Sept 10, 2023
FHEROES2_VERSION = b38abb6402aa84060b5e5e2c5bbf6ed38ae8734e
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
