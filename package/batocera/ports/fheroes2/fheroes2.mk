################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Jun 02, 2024
FHEROES2_VERSION = 6de494121a01db1d27904b16d38f9006e6f8cbfe
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
