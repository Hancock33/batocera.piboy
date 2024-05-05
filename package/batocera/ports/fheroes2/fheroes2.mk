################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on May 05, 2024
FHEROES2_VERSION = 7869a9f59c4e3e5768647c1fbd99af980fe317f4
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
