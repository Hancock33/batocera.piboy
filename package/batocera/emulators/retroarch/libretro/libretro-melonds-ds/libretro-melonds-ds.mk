################################################################################
#
# libretro-melonds-ds
#
################################################################################
# Version: Commits on Jun 12, 2024
LIBRETRO_MELONDS_DS_VERSION = f8707d641eb264b4c75942e94e7d9768384d4202
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
