################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Nov 07, 2023
FHEROES2_VERSION = c38b6780eda7824d3b36fd91c301df29c3dfca55
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
