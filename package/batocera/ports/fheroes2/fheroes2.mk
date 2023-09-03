################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Sept 03, 2023
FHEROES2_VERSION = edd2ca7b08b5b89b4c7cafa28b969e6e8aa90a91
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
