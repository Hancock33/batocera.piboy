################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Apr 03, 2024
FHEROES2_VERSION = 074fb20bca5d83fbfcb6e76ec2b0ff54e19b0b83
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
