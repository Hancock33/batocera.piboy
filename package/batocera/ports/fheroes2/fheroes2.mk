################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Jan 27, 2024
FHEROES2_VERSION = 04b7efda566eaca724ec0563ee7d785584a502b2
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
