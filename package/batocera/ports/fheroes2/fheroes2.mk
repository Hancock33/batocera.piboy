################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Aug 20, 2023
FHEROES2_VERSION = 088e8a8c77eb0de300865c32c1a8172096167d4b
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
