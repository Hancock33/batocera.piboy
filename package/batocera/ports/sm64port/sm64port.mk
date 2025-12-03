################################################################################
#
# sm64port
#
################################################################################
# Version: Commits on Oct 16, 2025
SM64PORT_VERSION = fe187c151aa608361d30d1819edca131c0043cf9
SM64PORT_SITE = $(call github,N00byKing,sm64ex,$(SM64PORT_VERSION))
SM64PORT_DEPENDENCIES = sdl2

define SM64PORT_BUILD_CMDS
	cp /mnt/smb/sm64/baserom.*.z64 $(@D)/
	make -C $(@D)/tools
	$(TARGET_CONFIGURE_OPTS) $(MAKE) CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" -C $(@D)/ EXTERNAL_DATA=1 VERSION=eu BETTERCAMERA=1 NODRAWINGDISTANCE=1 TEXTURE_FIX=1 EXT_OPTIONS_MENU=1 OPT_FLAGS="$(TARGET_OPTIMIZATION)" PLATFORM_CFLAGS="-Wno-implicit-function-declaration"
	$(TARGET_CONFIGURE_OPTS) $(MAKE) CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" -C $(@D)/ EXTERNAL_DATA=1 VERSION=jp BETTERCAMERA=1 NODRAWINGDISTANCE=1 TEXTURE_FIX=1 EXT_OPTIONS_MENU=1 OPT_FLAGS="$(TARGET_OPTIMIZATION)"
	$(TARGET_CONFIGURE_OPTS) $(MAKE) CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" -C $(@D)/ EXTERNAL_DATA=1 VERSION=us BETTERCAMERA=1 NODRAWINGDISTANCE=1 TEXTURE_FIX=1 EXT_OPTIONS_MENU=1 OPT_FLAGS="$(TARGET_OPTIMIZATION)"
endef

define SM64PORT_INSTALL_TARGET_CMDS
	$(INSTALL) -D $(@D)/build/eu_pc/sm64.eu* $(TARGET_DIR)/usr/bin/sm64.eu
	$(INSTALL) -D $(@D)/build/jp_pc/sm64.jp* $(TARGET_DIR)/usr/bin/sm64.jp
	$(INSTALL) -D $(@D)/build/us_pc/sm64.us* $(TARGET_DIR)/usr/bin/sm64.us
endef

$(eval $(generic-package))
