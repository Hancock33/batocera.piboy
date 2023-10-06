################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Oct 06, 2023
FHEROES2_VERSION = 679d085cd8bcefa8894bff59c92b48fdd3bec748
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
