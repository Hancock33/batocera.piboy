################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Sept 21, 2023
FHEROES2_VERSION = d91729fb694bb4e3b89f04ec1af55929627ca6bb
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
