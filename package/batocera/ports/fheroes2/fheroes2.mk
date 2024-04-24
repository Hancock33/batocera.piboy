################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Apr 24, 2024
FHEROES2_VERSION = 4fd43fb5356207581ca65e06440b0c262d8425b3
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
