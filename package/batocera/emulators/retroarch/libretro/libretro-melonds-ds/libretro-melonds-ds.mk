################################################################################
#
# libretro-melonds-ds
#
################################################################################
# Version: Commits on Sept 26, 2025
LIBRETRO_MELONDS_DS_VERSION = 86986bfd82fb130d4d4739d93159acd986921808
LIBRETRO_MELONDS_DS_SITE = $(call github,JesseTG,melonds-ds,$(LIBRETRO_MELONDS_DS_VERSION))
LIBRETRO_MELONDS_DS_SUPPORTS_IN_SOURCE_BUILD = NO
LIBRETRO_MELONDS_DS_LICENSE = GPLv2
LIBRETRO_MELONDS_DS_DEPENDENCIES = libpcap retroarch

LIBRETRO_MELONDS_DS_CONF_OPTS += -DBUILD_SHARED_LIBS=OFF
LIBRETRO_MELONDS_DS_CONF_OPTS += -DCMAKE_CXX_FLAGS="$(TARGET_CFLAGS) -flto=auto"
LIBRETRO_MELONDS_DS_CONF_OPTS += -DCMAKE_EXE_LINKER_FLAGS="$(LIBRETRO_MELONDS_DS_EXE_LINKER_FLAGS)"
LIBRETRO_MELONDS_DS_CONF_OPTS += -DCMAKE_SHARED_LINKER_FLAGS="$(LIBRETRO_MELONDS_DS_SHARED_LINKER_FLAGS)"
LIBRETRO_MELONDS_DS_EXE_LINKER_FLAGS += -flto=auto
LIBRETRO_MELONDS_DS_SHARED_LINKER_FLAGS += -flto=auto

define LIBRETRO_MELONDS_DS_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/lib/libretro
	mkdir -p $(TARGET_DIR)/usr/share/libretro/info
	$(INSTALL) -D $(@D)/buildroot-build/src/libretro/melondsds_libretro.so	$(TARGET_DIR)/usr/lib/libretro/melondsds_libretro.so
	cp $(@D)/buildroot-build/melondsds_libretro.info						$(TARGET_DIR)/usr/share/libretro/info/melondsds_libretro.info
endef

$(eval $(cmake-package))
