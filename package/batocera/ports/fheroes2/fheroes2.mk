################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Feb 06, 2024
FHEROES2_VERSION = e6d753cf0c2421a6dc5a6b6fcaeb35acb0149c27
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
