################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Jun 03, 2024
FHEROES2_VERSION = 8c3a6a4026f27abaa63595b958d8d332fd8967cf
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
