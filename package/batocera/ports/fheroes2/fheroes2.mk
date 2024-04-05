################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Apr 05, 2024
FHEROES2_VERSION = 6e98853e4416fcd4653b903b105054f0d29857e2
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
