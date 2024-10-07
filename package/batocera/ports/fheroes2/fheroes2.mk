################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Oct 06, 2024
FHEROES2_VERSION = ce666ee38d18291b197504923b2a34cc3e7d33e1
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
