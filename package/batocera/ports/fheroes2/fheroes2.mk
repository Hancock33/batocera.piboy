################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Jan 20, 2024
FHEROES2_VERSION = b3bd0a070be1c0146142769aca190e47bcf50749
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
