################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Dec 23, 2023
FHEROES2_VERSION = 03fab3208d4050f972ae52060860d22fbd994d98
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
