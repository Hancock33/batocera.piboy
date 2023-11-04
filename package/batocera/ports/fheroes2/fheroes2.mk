################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Nov 04, 2023
FHEROES2_VERSION = 876bd96b5324208298af63bf5317c9521af17688
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
