################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Jan 07, 2024
FHEROES2_VERSION = 37174687ea77348d8dfa2ce7405a20f93bf7e502
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
