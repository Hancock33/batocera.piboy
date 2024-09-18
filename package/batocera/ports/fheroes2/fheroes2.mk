################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Sept 18, 2024
FHEROES2_VERSION = c430476551d690716aa247197bf7f647a6178695
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
