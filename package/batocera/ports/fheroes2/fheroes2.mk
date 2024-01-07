################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Jan 07, 2024
FHEROES2_VERSION = 296bd4a3fbec827b3c43807ef800f2d6577e175d
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
