################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Oct 25, 2024
FHEROES2_VERSION = 337f9555878d0dee9a7684ba40f0f95dba1cc5bd
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
