################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Nov 28, 2023
FHEROES2_VERSION = 4bdbe56d744733b981fb892994ae93c0e2b241cf
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
