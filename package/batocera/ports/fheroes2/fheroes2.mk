################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Sept 12, 2023
FHEROES2_VERSION = 6661d5877b07a2d1cc39ddb8c26ba166a0e800e3
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
