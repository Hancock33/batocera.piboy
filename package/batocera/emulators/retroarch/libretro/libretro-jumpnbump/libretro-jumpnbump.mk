################################################################################
#
# libretro-jumpnbump
#
################################################################################
# Version: Commits on Apr 20, 2026
LIBRETRO_JUMPNBUMP_VERSION = 25efe413d2159177e54323fb0b9d34966ca019c9
LIBRETRO_JUMPNBUMP_SITE = $(call github,libretro,jumpnbump-libretro,$(LIBRETRO_JUMPNBUMP_VERSION))
LIBRETRO_JUMPNBUMP_LICENSE = GPL-2.0
LIBRETRO_JUMPNBUMP_EMULATOR_INFO = jumpnbump.libretro.core.yml

define LIBRETRO_JUMPNBUMP_BUILD_CMDS
	$(SED) "s|\-O[23]|$(TARGET_OPTIMIZATION)|g" $(@D)/Makefile
	$(TARGET_CONFIGURE_OPTS) $(MAKE) CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" -C $(@D)/ -f Makefile platform="unix"
endef

define LIBRETRO_JUMPNBUMP_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/lib/libretro
	mkdir -p $(TARGET_DIR)/usr/share/libretro/info
	$(INSTALL) -D $(@D)/jumpnbump_libretro.so $(TARGET_DIR)/usr/lib/libretro/jumpnbump_libretro.so
	$(INSTALL) -D $(@D)/jumpnbump_libretro.info $(TARGET_DIR)/usr/share/libretro/info/jumpnbump_libretro.info
endef

$(eval $(generic-package))
$(eval $(emulator-info-package))
