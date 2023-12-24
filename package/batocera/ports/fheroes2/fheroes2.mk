################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Dec 24, 2023
FHEROES2_VERSION = 79c2347bf5adf6888dff2fa07db98acf6b387702
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
