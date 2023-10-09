################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Oct 09, 2023
FHEROES2_VERSION = 9fd346075a07e1cfba2e509e125b608cf0be295f
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
