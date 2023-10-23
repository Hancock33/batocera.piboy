################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Oct 23, 2023
FHEROES2_VERSION = 494d52775ec0462885caab0e6415a104a6be08dd
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
