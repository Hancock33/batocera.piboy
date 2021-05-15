################################################################################
#
# XRICK
#
################################################################################
#commits on May 12,2021
LIBRETRO_XRICK_VERSION = f281911d5b5f99770b7fc1f2aee7dff29a9754c1
LIBRETRO_XRICK_SITE = $(call github,libretro,xrick-libretro,$(LIBRETRO_XRICK_VERSION))
LIBRETRO_XRICK_LICENSE = GPL-3.0

define LIBRETRO_XRICK_BUILD_CMDS
	$(SED) "s|-O2|-O3|g" $(@D)/Makefile.libretro
	CFLAGS="$(TARGET_CFLAGS) $(COMPILER_COMMONS_CFLAGS_SO)" \
		CXXFLAGS="$(TARGET_CXXFLAGS) $(COMPILER_COMMONS_CXXFLAGS_SO)" \
		LDFLAGS="$(TARGET_LDFLAGS) $(COMPILER_COMMONS_LDFLAGS_SO)" \
		$(MAKE) CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" -C $(@D)/ -f Makefile.libretro platform="unix"
endef

define LIBRETRO_XRICK_INSTALL_TARGET_CMDS
	$(INSTALL) -D $(@D)/xrick_libretro.so \
		$(TARGET_DIR)/usr/lib/libretro/xrick_libretro.so
	mkdir -p "$(TARGET_DIR)/usr/share/batocera/datainit/roms/xrick"
	$(INSTALL) -D $(@D)/data.zip "$(TARGET_DIR)/usr/share/batocera/datainit/roms/xrick/data.zip"
endef

$(eval $(generic-package))
