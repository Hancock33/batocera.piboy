################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Jul 09, 2024
FHEROES2_VERSION = 5655e858e31a43446bbd25d0d405d75923522a6f
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
