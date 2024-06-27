################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Jun 27, 2024
FHEROES2_VERSION = 8bd28bef1aaa0d23c02c19e1094f398e2e8fc962
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
