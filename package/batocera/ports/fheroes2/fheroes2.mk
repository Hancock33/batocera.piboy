################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Mar 16, 2024
FHEROES2_VERSION = 730031d12ca125a56058b04fbe2aecbc14ecf435
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
