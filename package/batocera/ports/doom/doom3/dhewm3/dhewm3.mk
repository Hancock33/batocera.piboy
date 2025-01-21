################################################################################
#
# dhewm3
#
################################################################################
# Version: Commits on Jan 21, 2025
DHEWM3_VERSION = 0110a624a3ca75edb1f4b9ead7ccf08d68d30737
DHEWM3_SITE = $(call github,dhewm,dhewm3,$(DHEWM3_VERSION))
DHEWM3_LICENSE = GPL-3.0
DHEWM3_LICENSE_FILES = COPYING.txt
DHEWM3_SUPPORTS_IN_SOURCE_BUILD = NO
DHEWM3_SUBDIR = neo
DHEWM3_DEPENDENCIES = host-libjpeg libcurl libogg libvorbis openal sdl2 zlib

DHEWM3_CONF_OPTS += -DSDL2=ON

define DHEWM3_KEYS
	mkdir -p $(TARGET_DIR)/usr/share/evmapy
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/ports/doom/doom3/dhewm3/doom3.keys $(TARGET_DIR)/usr/share/evmapy
endef

DHEWM3_PRE_INSTALL_TARGET_HOOKS += DHEWM3_KEYS

$(eval $(cmake-package))
