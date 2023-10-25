################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Oct 25, 2023
FHEROES2_VERSION = 4e58ef795c842a6f7f384c9c866860e2ec745f49
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
