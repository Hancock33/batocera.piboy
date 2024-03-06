################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Mar 06, 2024
FHEROES2_VERSION = a17b6798ba3a6aa7e81b6cd641bb83dd738a1e03
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
