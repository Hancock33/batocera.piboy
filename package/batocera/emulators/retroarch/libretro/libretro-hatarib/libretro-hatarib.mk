################################################################################
#
# libretro-hatarib
#
################################################################################
# Version: Commits on Dec 18, 2023
LIBRETRO_HATARIB_VERSION = c4058f8f43738b0e1de86548d6b1216a7953b2d0
LIBRETRO_HATARIB_SITE = https://github.com/bbbradsmith/hatariB
LIBRETRO_HATARIB_SITE_METHOD=git
LIBRETRO_HATARIB_LICENSE = GPLv2
LIBRETRO_HATARIB_DEPENDENCIES = libcapsimage libpng zlib sdl2

LIBRETRO_HATARIB_GIT_SUBMODULES = YES

LIBRETRO_HATARIB_CONF_ENV += \
	SHORTHASH='"$(shell echo $(LIBRETRO_HATARIB_VERSION) | cut -c 1-7)"' \
	SDL2_INCLUDE="$(STAGING_DIR)/usr/include/SDL2" \
	SDL2_LIB="$(STAGING_DIR)/usr/lib" \
	SDL2_LINK="$(STAGING_DIR)/usr/lib/libSDL2.so" \
	ZLIB_INCLUDE="$(STAGING_DIR)/usr/include" \
	ZLIB_LIB="$(STAGING_DIR)/usr/lib" \
	ZLIB_LINK="$(STAGING_DIR)/usr/lib/libz.so" \
	CMAKE="$(HOST_DIR)/bin/cmake"

define LIBRETRO_HATARIB_BUILD_CMDS
	$(SED) "s|-O2|$(TARGET_OPTIMIZATION)|g" $(@D)/makefile
	$(SED) "s|-O3|$(TARGET_OPTIMIZATION)|g" $(@D)/makefile
	CC="$(TARGET_CC)" AR="$(TARGET_AR)" RANLIB="$(TARGET_RANLIB)" \
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
