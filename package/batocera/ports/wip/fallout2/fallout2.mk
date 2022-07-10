################################################################################
#
# Fallout 2
#
################################################################################
# Version: Commits on Jul 07, 2022
FALLOUT2_VERSION = c562d83020f55b25e5aa5fbd0be4faf3b29779cf
FALLOUT2_SITE = $(call github,alexbatalov,fallout2-ce,$(FALLOUT2_VERSION))

FALLOUT2_DEPENDENCIES = sdl2 sdl2_image sdl2_mixer sdl2_net sdl2_ttf
FALLOUT2_LICENSE = GPL-3.0
FALLOUT2_SUPPORTS_IN_SOURCE_BUILD = NO

FALLOUT2_CONF_OPTS += -DCMAKE_BUILD_TYPE=Release

$(eval $(cmake-package))
