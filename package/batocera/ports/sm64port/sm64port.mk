################################################################################
#
# sm64port
#
################################################################################
# Version: Commits on Nov 30, 2021
SM64PORT_VERSION = db9a6345baa5acb41f9d77c480510442cab26025
SM64PORT_SITE = $(call github,sm64pc,sm64ex,$(SM64PORT_VERSION))
SM64PORT_DEPENDENCIES = sdl2

define SM64PORT_BUILD_CMDS
	cp /mnt/smb/sm64/baserom.*.z64 $(@D)/
	make -j1 -C $(@D)/tools
	$(TARGET_CONFIGURE_OPTS) $(MAKE) CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" -C $(@D)/ EXTERNAL_DATA=1 VERSION=eu BETTERCAMERA=1 NODRAWINGDISTANCE=1 TEXTURE_FIX=1 EXT_OPTIONS_MENU=1
	$(TARGET_CONFIGURE_OPTS) $(MAKE) CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" -C $(@D)/ EXTERNAL_DATA=1 VERSION=jp BETTERCAMERA=1 NODRAWINGDISTANCE=1 TEXTURE_FIX=1 EXT_OPTIONS_MENU=1
	$(TARGET_CONFIGURE_OPTS) $(MAKE) CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" -C $(@D)/ EXTERNAL_DATA=1 VERSION=us BETTERCAMERA=1 NODRAWINGDISTANCE=1 TEXTURE_FIX=1 EXT_OPTIONS_MENU=1
endef

define SM64PORT_INSTALL_TARGET_CMDS
	$(INSTALL) -D $(@D)/build/eu_pc/sm64.eu* $(TARGET_DIR)/usr/bin/sm64.eu
	$(INSTALL) -D $(@D)/build/jp_pc/sm64.jp* $(TARGET_DIR)/usr/bin/sm64.jp
	$(INSTALL) -D $(@D)/build/us_pc/sm64.us* $(TARGET_DIR)/usr/bin/sm64.us

	# evmap config
	mkdir -p $(TARGET_DIR)/usr/share/evmapy
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/ports/sm64port/sm64.keys $(TARGET_DIR)/usr/share/evmapy/sm64.keys
endef

$(eval $(generic-package))
