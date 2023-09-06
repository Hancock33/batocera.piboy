################################################################################
#
# libretro-hatarib
#
################################################################################
# Version: Commits on Sept 06, 2023
LIBRETRO_HATARIB_VERSION = b85cfcc7cf7ee210395e3e8e605cb1298352790d
LIBRETRO_HATARIB_SITE = https://github.com/bbbradsmith/hatariB
LIBRETRO_HATARIB_SITE_METHOD=git
LIBRETRO_HATARIB_LICENSE = GPLv2
LIBRETRO_HATARIB_DEPENDENCIES = libcapsimage libpng libzlib sdl2

LIBRETRO_HATARIB_GIT_SUBMODULES = YES

LIBRETRO_HATARIB_CONF_ENV += \
	SHORTHASH='"$(shell echo $(LIBRETRO_HATARIB_VERSION) | cut -c 1-7)"' \
	SDL2_INCLUDE="$(STAGING_DIR)/usr/include/SDL2" \
	SDL2_LIB="$(STAGING_DIR)/usr/lib" \
	SDL2_LINK="$(STAGING_DIR)/usr/lib/libSDL2.so" \
	ZLIB_INCLUDE="$(STAGING_DIR)/usr/include" \
	ZLIB_LIB="$(STAGING_DIR)/usr/lib" \
	ZLIB_LINK="$(STAGING_DIR)/usr/lib/libz.so" \
	CC="$(TARGET_CC)" \
	AR="$(TARGET_AR)" \
	RANLIB="$(TARGET_RANLIB)"

LIBRETRO_HATARIB_REPLACE_CCFG =-DCMAKE_TOOLCHAIN_FILE=$(HOST_DIR)/share/buildroot/toolchainfile.cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_C_FLAGS_RELEASE="$(TARGET_OPTIMIZATION) -fPIC"

define LIBRETRO_HATARIB_BUILD_CMDS
	$(SED) "s|-O3|$(TARGET_OPTIMIZATION)|g" $(@D)/makefile
	$(SED) 's|cmake |$(HOST_DIR)/bin/cmake |g' $(@D)/makefile
	$(SED) 's:.. $$(CMAKEFLAGS):.. $(LIBRETRO_HATARIB_REPLACE_CCFG):g' $(@D)/makefile

	cd $(@D) && $(MAKE) -f makefile \
	$(LIBRETRO_HATARIB_CONF_ENV)
endef

define LIBRETRO_HATARIB_INSTALL_TARGET_CMDS
	$(INSTALL) -D $(@D)/build/hatarib.so \
		$(TARGET_DIR)/usr/lib/libretro/hatarib_libretro.so

	# install core info file
	mkdir -p $(TARGET_DIR)/usr/share/libretro/info
	cp -a $(@D)/info/hatarib.info $(TARGET_DIR)/usr/share/libretro/info/hatarib_libretro.info
endef

$(eval $(generic-package))
