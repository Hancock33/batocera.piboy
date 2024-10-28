################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Oct 28, 2024
FHEROES2_VERSION = e7d7091cc95eb41089e94e23551eac1be5087a4e
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
