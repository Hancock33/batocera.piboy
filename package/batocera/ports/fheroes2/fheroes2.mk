################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Nov 22, 2024
FHEROES2_VERSION = a6ee4c1c70b0a02d8dbdb3994c45cd1693fae0ac
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
