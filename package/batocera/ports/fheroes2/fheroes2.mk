################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Apr 13, 2024
FHEROES2_VERSION = a06678bc3c66b327af4d569fa01bcab7d9f28744
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
