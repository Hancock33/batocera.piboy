################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Jan 30, 2024
FHEROES2_VERSION = 73cffa5716419d7a20904f0836306c4da65788ec
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
