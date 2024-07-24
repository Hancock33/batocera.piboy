################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Jul 24, 2024
FHEROES2_VERSION = d7cb8253ea82cff4a81933b37abe177f1dfb084e
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
