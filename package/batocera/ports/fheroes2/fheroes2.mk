################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Aug 28, 2023
FHEROES2_VERSION = cad05a370af9d94fe7cc93874dc1ad9c10547e9f
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
