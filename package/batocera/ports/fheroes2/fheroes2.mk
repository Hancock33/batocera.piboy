################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Jan 15, 2024
FHEROES2_VERSION = 0263bf7b3c5dcc98b8b26e36bceced48edc6b610
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
