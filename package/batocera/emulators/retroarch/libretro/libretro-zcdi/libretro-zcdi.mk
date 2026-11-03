################################################################################
#
# libretro-zcdi
#
################################################################################
# Version: Commits on Nov 02, 2026
LIBRETRO_ZCDI_VERSION = b7481411e6939b2c1745067a646bfd43479e2a3c
LIBRETRO_ZCDI_SITE = $(call github,pastisme,zcdi,$(LIBRETRO_ZCDI_VERSION))
LIBRETRO_ZCDI_LICENSE = GPL-3.0+
LIBRETRO_ZCDI_LICENSE_FILES = LICENSE
LIBRETRO_ZCDI_SUPPORTS_IN_SOURCE_BUILD = NO
LIBRETRO_ZCDI_DEPENDENCIES = retroarch
LIBRETRO_ZCDI_EMULATOR_INFO = zcdi.libretro.core.yml

LIBRETRO_ZCDI_CONF_OPTS += -DBUILD_SHARED_LIBS=OFF
LIBRETRO_ZCDI_CONF_OPTS += -DZCDI_ENABLE_LIBRETRO=ON
LIBRETRO_ZCDI_CONF_OPTS += -DZCDI_BUILD_TESTS=OFF

define LIBRETRO_ZCDI_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/lib/libretro
	mkdir -p $(TARGET_DIR)/usr/share/libretro/info
	$(INSTALL) -D $(@D)/buildroot-build/zcdi_libretro.so $(TARGET_DIR)/usr/lib/libretro/zcdi_libretro.so
	$(INSTALL) -D -m 0644 $(@D)/src/libretro/zcdi_libretro.info $(TARGET_DIR)/usr/share/libretro/info/zcdi_libretro.info
endef

$(eval $(cmake-package))
$(eval $(emulator-info-package))
