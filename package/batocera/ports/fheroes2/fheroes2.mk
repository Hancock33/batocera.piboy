################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Apr 12, 2026
FHEROES2_VERSION = 1.1.15
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_EMULATOR_INFO = fheroes2.emulator.yml
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
$(eval $(emulator-info-package))
