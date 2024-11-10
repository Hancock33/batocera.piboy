################################################################################
#
# doom3
#
################################################################################
# Version: Commits on Nov 07, 2024
DOOM3_VERSION = d94bb42d5048148f5358a3d7cf0f5bd6eb817f4a
DOOM3_SITE = $(call github,dhewm,dhewm3,$(DOOM3_VERSION))
DOOM3_LICENSE = GPL-3.0
DOOM3_LICENSE_FILES = COPYING.txt
DOOM3_SUPPORTS_IN_SOURCE_BUILD = NO
DOOM3_SUBDIR = neo
DOOM3_DEPENDENCIES = host-libjpeg libcurl libogg libvorbis openal sdl2 zlib

DOOM3_CONF_OPTS += -DSDL2=ON

define DOOM3_KEYS
	mkdir -p $(TARGET_DIR)/usr/share/evmapy
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/ports/doom/doom3/doom3.keys $(TARGET_DIR)/usr/share/evmapy
endef

DOOM3_PRE_INSTALL_TARGET_HOOKS += DOOM3_KEYS

$(eval $(cmake-package))
