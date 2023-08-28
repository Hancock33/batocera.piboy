################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Aug 28, 2023
FHEROES2_VERSION = 11b28eb948cd0f68fadfbe57e15914a6ace271ed
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
