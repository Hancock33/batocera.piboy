################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Jul 21, 2024
FHEROES2_VERSION = 5c1da8f0428ced2cf4ee5ad8a961d36e867386ef
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
