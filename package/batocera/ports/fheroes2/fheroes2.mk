################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Jul 26, 2024
FHEROES2_VERSION = 471570ec2f8055aba51ac447974d7ad7e9a86655
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
