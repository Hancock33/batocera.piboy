################################################################################
#
# opentyrian
#
################################################################################
# Version: Commits on Apr 05, 2023
MAELSTROM_VERSION = 767d95c9f2afc3044e86b7c2249e80848d95f0bb
MAELSTROM_SITE = $(call github,libsdl-org,Maelstrom,$(MAELSTROM_VERSION))
MAELSTROM_LICENSE = GPL-2.0+
MAELSTROM_LICENSE_FILES = COPYING

MAELSTROM_DEPENDENCIES = sdl2 sdl2_net
#MAELSTROM_AUTORECONF = YES
MAELSTROM_SUPPORTS_IN_SOURCE_BUILD = NO
MAELSTROM_CONF_OPTS = \
	                --disable-sdltest \
	                --with-sdl-prefix="$(STAGING_DIR)/usr" \

$(eval $(autotools-package))

