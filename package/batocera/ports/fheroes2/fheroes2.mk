################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Mar 14, 2024
FHEROES2_VERSION = b134569a61d7e97f3c57291a93420285ff20a591
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
