################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Oct 09, 2024
FHEROES2_VERSION = 6190c0e131adc22aefe7a6885ee1cb224a5b7747
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
