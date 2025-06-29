################################################################################
#
# libretro-melonds-ds
#
################################################################################
# Version: Commits on Jun 03, 2025
LIBRETRO_MELONDS_DS_VERSION = e1391cc10a53b205963b7d1bd2b1f8d87d0d2cc7
LIBRETRO_MELONDS_DS_SITE = $(call github,JesseTG,melonds-ds,$(LIBRETRO_MELONDS_DS_VERSION))
LIBRETRO_MELONDS_DS_BRANCH = dev
LIBRETRO_MELONDS_DS_SUPPORTS_IN_SOURCE_BUILD = NO
LIBRETRO_MELONDS_DS_LICENSE = GPLv2
LIBRETRO_MELONDS_DS_DEPENDENCIES = libpcap retroarch

LIBRETRO_MELONDS_DS_CONF_OPTS += -DBUILD_SHARED_LIBS=OFF
LIBRETRO_MELONDS_DS_CONF_OPTS += -DCMAKE_MODULE_LINKER_FLAGS="-flto"

define LIBRETRO_MELONDS_DS_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/lib/libretro
	mkdir -p $(TARGET_DIR)/usr/share/libretro/info
	$(INSTALL) -D $(@D)/buildroot-build/src/libretro/melondsds_libretro.so	$(TARGET_DIR)/usr/lib/libretro/melondsds_libretro.so
	cp $(@D)/buildroot-build/melondsds_libretro.info						$(TARGET_DIR)/usr/share/libretro/info/melondsds_libretro.info
endef

$(eval $(cmake-package))
