################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Jun 01, 2024
FHEROES2_VERSION = 596bbc27595ac5bb9007e9d1db57c7172c53aa68
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
