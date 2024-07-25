################################################################################
#
# libretro-melonds-ds
#
################################################################################
# Version: Commits on Jul 25, 2024
LIBRETRO_MELONDS_DS_VERSION = 904743f299dacf108fd0caa1733f572b8503a74a
LIBRETRO_MELONDS_DS_SITE = $(call github,JesseTG,melonds-ds,$(LIBRETRO_MELONDS_DS_VERSION))
LIBRETRO_MELONDS_DS_LICENSE = GPLv2
LIBRETRO_MELONDS_DS_DEPENDENCIES = libpcap

LIBRETRO_MELONDS_DS_SUPPORTS_IN_SOURCE_BUILD = NO

LIBRETRO_MELONDS_DS_CONF_OPTS += -DCMAKE_C_COMPILER=$(HOST_DIR)/bin/$(GNU_TARGET_NAME)-gcc
LIBRETRO_MELONDS_DS_CONF_OPTS += -DCMAKE_CXX_COMPILER=$(HOST_DIR)/bin/$(GNU_TARGET_NAME)-g++
LIBRETRO_MELONDS_DS_CONF_OPTS += -DBUILD_SHARED_LIBS=OFF

define LIBRETRO_MELONDS_DS_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/share/libretro/info
	$(INSTALL) -D $(@D)/buildroot-build/src/libretro/melondsds_libretro.so	$(TARGET_DIR)/usr/lib/libretro/melondsds_libretro.so
	cp $(@D)/buildroot-build/melondsds_libretro.info						$(TARGET_DIR)/usr/share/libretro/info/melondsds_libretro.info
endef

$(eval $(cmake-package))
