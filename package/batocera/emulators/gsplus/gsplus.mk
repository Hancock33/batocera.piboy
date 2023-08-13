################################################################################
#
# gsplus
#
################################################################################
# Version: Commits on Jan 14, 2021
GSPLUS_VERSION = dc1835d62bb485f69faf3fd50a2550629393ee38
GSPLUS_SITE = $(call github,applemu,gsplus,$(GSPLUS_VERSION))
GSPLUS_LICENSE = GPLv2
GSPLUS_DEPENDENCIES = sdl2 libpcap host-re2c
GSPLUS_CMAKE_BACKEND = ninja

GSPLUS_CONF_OPTS  = -DCMAKE_BUILD_TYPE=Release

define GSPLUS_INSTALL_TARGET_CMDS
	$(INSTALL) -D $(@D)/bin/GSplus $(TARGET_DIR)/usr/bin/
	$(INSTALL) -D $(@D)/bin/libx_readline.so $(TARGET_DIR)/usr/lib/
	cp -f $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/gsplus/apple2gs.gsplus.keys $(TARGET_DIR)/usr/share/evmapy
	cd $(TARGET_DIR)/usr/share/evmapy && ln -sf apple2gs.gsplus.keys apple2.gsplus.keys
endef

$(eval $(cmake-package))
