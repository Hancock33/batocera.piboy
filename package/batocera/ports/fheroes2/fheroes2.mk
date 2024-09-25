################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Sept 25, 2024
FHEROES2_VERSION = 4f593c4782df14a3412cb1509f31f2588a6c1f1a
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
