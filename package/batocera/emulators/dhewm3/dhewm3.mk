################################################################################
#
# dhewm3
#
################################################################################
# Version: Commits on Oct 29, 2024
DHEWM3_VERSION = 81cab591da33ffd8c92baa90ba2b610c08442fe0
DHEWM3_SITE = $(call github,dhewm,dhewm3,$(DHEWM3_VERSION))
DHEWM3_LICENSE = GPLv3
DHEWM3_LICENSE_FILES = COPYING.txt
DHEWM3_SUBDIR = neo

DHEWM3_DEPENDENCIES = host-libjpeg libcurl libogg libvorbis openal sdl2 zlib 

define DHEWM3_EVMAPY
	mkdir -p $(TARGET_DIR)/usr/share/evmapy
	cp -prn $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/dhewm3/doom3.dhewm3.keys \
		$(TARGET_DIR)/usr/share/evmapy
endef

DHEWM3_POST_INSTALL_TARGET_HOOKS = DHEWM3_EVMAPY

$(eval $(cmake-package))
