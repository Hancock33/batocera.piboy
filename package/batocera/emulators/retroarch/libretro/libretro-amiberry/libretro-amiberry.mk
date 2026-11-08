################################################################################
#
# libretro-amiberry
#
################################################################################
# Version: Commits on Oct 27, 2026
LIBRETRO_AMIBERRY_VERSION = v8.5.0
LIBRETRO_AMIBERRY_SITE = https://github.com/BlitterStudio/amiberry.git
LIBRETRO_AMIBERRY_SITE_METHOD = git
LIBRETRO_AMIBERRY_GIT_SUBMODULES = YES
LIBRETRO_AMIBERRY_LICENSE = GPL-3.0+
LIBRETRO_AMIBERRY_LICENSE_FILES = LICENSE
LIBRETRO_AMIBERRY_SUPPORTS_IN_SOURCE_BUILD = NO
LIBRETRO_AMIBERRY_DEPENDENCIES = retroarch zlib
LIBRETRO_AMIBERRY_EMULATOR_INFO = amiberry.libretro.core.yml

define LIBRETRO_AMIBERRY_FIX_MAKEFILE
	$(SED) "s|\-O[23]|$(TARGET_OPTIMIZATION)|g" $(@D)/libretro/Makefile
endef
LIBRETRO_AMIBERRY_PRE_CONFIGURE_HOOKS += LIBRETRO_AMIBERRY_FIX_MAKEFILE

define LIBRETRO_AMIBERRY_BUILD_CMDS
	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)/libretro -f Makefile \
		CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" platform=unix DEBUG=0
endef

LIBRETRO_AMIBERRY_BIOS_DIR = $(TARGET_DIR)/usr/share/batocera/datainit/bios/amiga

define LIBRETRO_AMIBERRY_INSTALL_TARGET_CMDS
	$(INSTALL) -D $(@D)/libretro/amiberry_libretro.so $(TARGET_DIR)/usr/lib/libretro/amiberry_libretro.so
	$(INSTALL) -D -m 0644 $(@D)/libretro/amiberry_libretro.info $(TARGET_DIR)/usr/share/libretro/info/amiberry_libretro.info

	# run-time files
	rm -rf $(LIBRETRO_AMIBERRY_BIOS_DIR)/whdboot
	mkdir -p $(LIBRETRO_AMIBERRY_BIOS_DIR)/whdboot/save-data
	cp -r $(@D)/whdboot/game-data $(@D)/whdboot/save-data $(LIBRETRO_AMIBERRY_BIOS_DIR)/whdboot/
	unzip -q -o $(@D)/whdboot/boot-data.zip -d $(LIBRETRO_AMIBERRY_BIOS_DIR)/whdboot/save-data
endef

$(eval $(generic-package))
$(eval $(emulator-info-package))
