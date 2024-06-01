################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Jun 01, 2024
FHEROES2_VERSION = 378c3430736464c2a38cae06b04f224cc732ce20
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
