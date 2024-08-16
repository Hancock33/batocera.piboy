################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Aug 16, 2024
FHEROES2_VERSION = fb8968a52afcb42d75b642a9b6dc6858b36b56d8
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
