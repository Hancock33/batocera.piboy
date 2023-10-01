################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Oct 01, 2023
FHEROES2_VERSION = 5b7d2c93fe8a757a35eea33a38c26a3427d32b88
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
