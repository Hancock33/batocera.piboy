################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Jul 29, 2024
FHEROES2_VERSION = ce6aa75287fdf7470cf3928bf96f1d40f25386dd
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
