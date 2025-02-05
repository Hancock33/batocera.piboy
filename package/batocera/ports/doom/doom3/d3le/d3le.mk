################################################################################
#
# d3le
#
################################################################################
# Version: Commits on Feb 05, 2025
D3LE_VERSION = f1cf9267b0f3b7100ae6ecdbdc5a44b98547f246
D3LE_SITE = $(call github,dhewm,dhewm3-sdk,$(D3LE_VERSION))
D3LE_BRANCH = d3le
D3LE_LICENSE = GPLv3
D3LE_LICENSE_FILES = COPYING.txt

D3LE_DEPENDENCIES = dhewm3 host-libjpeg libcurl libogg libvorbis openal sdl2 zlib

D3LE_CONF_OPTS = -DBASE=OFF -DD3XP_NAME=d3le -DD3XP=ON

define D3LE_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/lib/dhewm3
	cp $(@D)/d3le.so $(TARGET_DIR)/usr/lib/dhewm3/
endef

$(eval $(cmake-package))
