################################################################################
#
# Free Heroes (of Might and Magic) 2 engine
#
################################################################################
# Version: Commits on Jul 31, 2023
FHEROES2_VERSION = 7fa37ccd75925b93f64a7b99fefb351382ad61a9
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
