################################################################################
#
# libretro-melonds-ds
#
################################################################################
# Version: Commits on Jul 25, 2026
LIBRETRO_MELONDS_DS_VERSION = 2748dfb9409c94e6828d937d04e334f35127ba7c
LIBRETRO_MELONDS_DS_SITE = $(call github,JesseTG,melonds-ds,$(LIBRETRO_MELONDS_DS_VERSION))
LIBRETRO_MELONDS_DS_SUPPORTS_IN_SOURCE_BUILD = NO
LIBRETRO_MELONDS_DS_LICENSE = GPLv2
LIBRETRO_MELONDS_DS_DEPENDENCIES = libpcap retroarch
LIBRETRO_MELONDS_DS_EMULATOR_INFO = melondsds.libretro.core.yml

LIBRETRO_MELONDS_DS_CONF_OPTS += -DBUILD_SHARED_LIBS=OFF
LIBRETRO_MELONDS_DS_CONF_OPTS += -DENABLE_LTO=OFF
LIBRETRO_MELONDS_DS_CONF_OPTS += -DENABLE_LTO_RELEASE=OFF

define LIBRETRO_MELONDS_DS_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/lib/libretro
	mkdir -p $(TARGET_DIR)/usr/share/libretro/info
	mkdir -p $(TARGET_DIR)/usr/share/libretro/info
	$(INSTALL) -D $(@D)/buildroot-build/src/libretro/melondsds_libretro.so	$(TARGET_DIR)/usr/lib/libretro/melondsds_libretro.so
	$(INSTALL) -D $(@D)/buildroot-build/melondsds_libretro.info $(TARGET_DIR)/usr/share/libretro/info/melondsds_libretro.info
endef

$(eval $(cmake-package))
$(eval $(emulator-info-package))
