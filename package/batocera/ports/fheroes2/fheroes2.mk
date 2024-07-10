################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Jul 10, 2024
FHEROES2_VERSION = b1735eff8ee18f855397fd1f7b7f5284113b0848
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
