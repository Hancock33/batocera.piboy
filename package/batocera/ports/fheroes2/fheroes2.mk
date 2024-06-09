################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Jun 09, 2024
FHEROES2_VERSION = 2a0adc90298212323a8f917f14a2bc9ad26fc63b
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
