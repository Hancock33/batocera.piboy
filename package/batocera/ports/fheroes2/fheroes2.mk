################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Mar 15, 2024
FHEROES2_VERSION = e42e9d63fb6232366f1b2862415d8db1dfc0bc75
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
