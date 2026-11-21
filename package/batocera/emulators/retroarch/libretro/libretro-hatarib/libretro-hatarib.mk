################################################################################
#
# libretro-hatarib
#
################################################################################
# Version: Commits on Oct 22, 2026
LIBRETRO_HATARIB_VERSION = 5f05733fc21903dce7d978bd0d7aae445ffe1185
LIBRETRO_HATARIB_SITE = https://github.com/bbbradsmith/hatariB
LIBRETRO_HATARIB_SITE_METHOD = git
LIBRETRO_HATARIB_LICENSE = GPLv2
LIBRETRO_HATARIB_DEPENDENCIES = libcapsimage libpng retroarch sdl2 zlib
LIBRETRO_HATARIB_EMULATOR_INFO = hatarib.libretro.core.yml

LIBRETRO_HATARIB_CONF_ENV += \
	CMAKE="$(BR2_CMAKE)" \
	SHORTHASH='"$(shell echo $(LIBRETRO_HATARIB_VERSION) | cut -c 1-7)"' \
	SDL2_INCLUDE="$(STAGING_DIR)/usr/include/SDL2" \
	SDL2_LIB="$(STAGING_DIR)/usr/lib" \
	SDL2_LINK="$(STAGING_DIR)/usr/lib/libSDL2.so" \
	ZLIB_INCLUDE="$(STAGING_DIR)/usr/include" \
	ZLIB_LIB="$(STAGING_DIR)/usr/lib" \
	ZLIB_LINK="$(STAGING_DIR)/usr/lib/libz.so" \
	CMAKEFLAGS="-DCMAKE_SYSTEM_NAME=Linux \
				-DCMAKE_SYSTEM_PROCESSOR=$(BR2_ARCH) \
				-DCMAKE_C_COMPILER=$(TARGET_CC) \
				-DCMAKE_CXX_COMPILER=$(TARGET_CXX) \
				-DCMAKE_CROSSCOMPILING=TRUE \
				-DCMAKE_DISABLE_FIND_PACKAGE_Readline=1 \
				-DCMAKE_DISABLE_FIND_PACKAGE_X11=1 \
				-DCMAKE_DISABLE_FIND_PACKAGE_PNG=1 \
				-DCMAKE_DISABLE_FIND_PACKAGE_PortMidi=1 \
				-DCMAKE_DISABLE_FIND_PACKAGE_CapsImage=1 \
				-DENABLE_SMALL_MEM=0"

define LIBRETRO_HATARIB_BUILD_CMDS
	$(SED) "s|\-O[23]|$(TARGET_OPTIMIZATION)|g" $(@D)/makefile
	cd $(@D) && $(MAKE) CC=$(TARGET_CC) -f makefile $(LIBRETRO_HATARIB_CONF_ENV)
endef

define LIBRETRO_HATARIB_INSTALL_TARGET_CMDS
	$(INSTALL) -D $(@D)/build/hatarib.so $(TARGET_DIR)/usr/lib/libretro/hatarib_libretro.so
	$(INSTALL) -D -m 0644 $(@D)/info/hatarib.info $(TARGET_DIR)/usr/share/libretro/info/hatarib_libretro.info
endef

$(eval $(generic-package))
$(eval $(emulator-info-package))
