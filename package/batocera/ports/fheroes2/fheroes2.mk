################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Feb 18, 2024
FHEROES2_VERSION = 164ee961ed56017f85724144a163b8b532687b8a
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
