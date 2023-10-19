################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Oct 19, 2023
FHEROES2_VERSION = 5f0feb06b525a893af2c4bd4b8a9c174dcbf7a58
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
