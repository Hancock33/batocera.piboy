################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Sept 29, 2024
FHEROES2_VERSION = a8a5eb71edbc7f9db0cabb73bbf3c0fb7f81da6d
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
