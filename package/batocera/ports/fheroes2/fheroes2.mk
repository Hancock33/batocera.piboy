################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Apr 03, 2024
FHEROES2_VERSION = b5a04090a4fb2756aaa36b4c1d0aa44eab13bc82
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
