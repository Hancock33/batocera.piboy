################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Sept 21, 2024
FHEROES2_VERSION = fedda6a48982fcfeeb6acf8861f0c8ee85ecbaa1
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
