################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Jan 02, 2024
FHEROES2_VERSION = 700a7613f5759fa7295958bed418ccabd64e647f
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
