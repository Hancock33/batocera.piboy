################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Oct 15, 2024
FHEROES2_VERSION = 5e86ba1900f1ea0eaa002a68cfa2b71300300a11
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
