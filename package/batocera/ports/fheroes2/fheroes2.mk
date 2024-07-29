################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Jul 29, 2024
FHEROES2_VERSION = 6addf3f3b733b9a42a19e1d421aa9962624cf58f
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
