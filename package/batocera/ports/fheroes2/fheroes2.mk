################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Sept 15, 2023
FHEROES2_VERSION = 9bd852f1317000024770cd23e5ed9072612f8fa6
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
