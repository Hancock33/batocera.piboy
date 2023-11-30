################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Nov 30, 2023
FHEROES2_VERSION = 09db1837aac1633582eb02c38b490957a4c8c631
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
