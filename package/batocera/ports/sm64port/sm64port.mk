################################################################################
#
# sm64port
#
################################################################################
# Version: Commits on May 11, 2024
SM64PORT_VERSION = a02075edc39b308cfd06992c47cc888d71c3dd45
SM64PORT_SITE = $(call github,sm64pc,sm64ex,$(SM64PORT_VERSION))
SM64PORT_DEPENDENCIES = sdl2

define SM64PORT_BUILD_CMDS
	cp /mnt/smb/sm64/baserom.*.z64 $(@D)/
	make CC="gcc-10" CXX="g++-10" -j1 -C $(@D)/tools
	#$(TARGET_CONFIGURE_OPTS) $(MAKE) CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" -C $(@D)/ EXTERNAL_DATA=1 VERSION=eu BETTERCAMERA=1 NODRAWINGDISTANCE=1 TEXTURE_FIX=1 EXT_OPTIONS_MENU=1 OPT_FLAGS="$(TARGET_OPTIMIZATION)"
	$(TARGET_CONFIGURE_OPTS) $(MAKE) CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" -C $(@D)/ EXTERNAL_DATA=1 VERSION=jp BETTERCAMERA=1 NODRAWINGDISTANCE=1 TEXTURE_FIX=1 EXT_OPTIONS_MENU=1 OPT_FLAGS="$(TARGET_OPTIMIZATION)"
	$(TARGET_CONFIGURE_OPTS) $(MAKE) CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" -C $(@D)/ EXTERNAL_DATA=1 VERSION=us BETTERCAMERA=1 NODRAWINGDISTANCE=1 TEXTURE_FIX=1 EXT_OPTIONS_MENU=1 OPT_FLAGS="$(TARGET_OPTIMIZATION)"
endef

define SM64PORT_INSTALL_TARGET_CMDS
	#$(INSTALL) -D $(@D)/build/eu_pc/sm64.eu* $(TARGET_DIR)/usr/bin/sm64.eu
	$(INSTALL) -D $(@D)/build/jp_pc/sm64.jp* $(TARGET_DIR)/usr/bin/sm64.jp
	$(INSTALL) -D $(@D)/build/us_pc/sm64.us* $(TARGET_DIR)/usr/bin/sm64.us

	# evmap config
	mkdir -p $(TARGET_DIR)/usr/share/evmapy
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/ports/sm64port/sm64.keys $(TARGET_DIR)/usr/share/evmapy/sm64.keys
endef

$(eval $(generic-package))
