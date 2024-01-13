################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Jan 13, 2024
FHEROES2_VERSION = f948694d3337d2d1050f468c5348e5361c3ca96d
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
