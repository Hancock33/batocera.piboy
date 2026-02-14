################################################################################
#
# libretro-hatarib
#
################################################################################
# Version: Commits on Feb 14, 2026
LIBRETRO_HATARIB_VERSION = 0e30a915649397eba8418aaf97e16ff5f84702af
LIBRETRO_HATARIB_SITE = https://github.com/bbbradsmith/hatariB
LIBRETRO_HATARIB_SITE_METHOD=git
LIBRETRO_HATARIB_LICENSE = GPLv2
LIBRETRO_HATARIB_DEPENDENCIES = libcapsimage libpng retroarch sdl2 zlib
LIBRETRO_HATARIB_EMULATOR_INFO = hatarib.libretro.core.yml

LIBRETRO_HATARIB_CONF_ENV += \
	SHORTHASH='"$(shell echo $(LIBRETRO_HATARIB_VERSION) | cut -c 1-7)"' \
	SDL2_INCLUDE="$(STAGING_DIR)/usr/include/SDL2" \
	SDL2_LIB="$(STAGING_DIR)/usr/lib" \
	SDL2_LINK="$(STAGING_DIR)/usr/lib/libSDL2.so" \
	ZLIB_INCLUDE="$(STAGING_DIR)/usr/include" \
	ZLIB_LIB="$(STAGING_DIR)/usr/lib" \
	ZLIB_LINK="$(STAGING_DIR)/usr/lib/libz.so" \
	CMAKE="$(HOST_DIR)/bin/cmake" \
	CC="$(TARGET_CC)"

define LIBRETRO_HATARIB_BUILD_CMDS
	$(SED) "s|\-O[23]|$(TARGET_OPTIMIZATION)|g" $(@D)/makefile
	CC="$(TARGET_CC)" AR="$(TARGET_AR)" RANLIB="$(TARGET_RANLIB)" \
	cd $(@D) && $(MAKE) -f makefile \
	$(LIBRETRO_HATARIB_CONF_ENV)
endef

define LIBRETRO_HATARIB_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/lib/libretro
	mkdir -p $(TARGET_DIR)/usr/share/libretro/info
	$(INSTALL) -D $(@D)/build/hatarib.so	$(TARGET_DIR)/usr/lib/libretro/hatarib_libretro.so
	cp -a $(@D)/info/hatarib.info			$(TARGET_DIR)/usr/share/libretro/info/hatarib_libretro.info
endef

$(eval $(generic-package))
$(eval $(emulator-info-package))
