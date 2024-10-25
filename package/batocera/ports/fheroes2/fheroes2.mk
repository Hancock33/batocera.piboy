################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Oct 25, 2024
FHEROES2_VERSION = c9fb0263935c7af746e3aab969cdc3f927fb8cc6
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
