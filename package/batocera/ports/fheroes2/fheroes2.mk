################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Sept 10, 2024
FHEROES2_VERSION = 9b91daeacfbd2163917134f394d29c3172ddc1e2
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
