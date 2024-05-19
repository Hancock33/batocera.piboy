################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on May 19, 2024
FHEROES2_VERSION = cd35b4d1345d03da9d32e8c2b118e74836561a94
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
