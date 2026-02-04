################################################################################
#
# libretro-melonds-ds
#
################################################################################
# Version: Commits on Jan 07, 2026
LIBRETRO_MELONDS_DS_VERSION = 0d65bd473d2dfda180fab7444664d76a4159350a
LIBRETRO_MELONDS_DS_SITE = $(call github,JesseTG,melonds-ds,$(LIBRETRO_MELONDS_DS_VERSION))
LIBRETRO_MELONDS_DS_SUPPORTS_IN_SOURCE_BUILD = NO
LIBRETRO_MELONDS_DS_LICENSE = GPLv2
LIBRETRO_MELONDS_DS_DEPENDENCIES = libpcap retroarch
LIBRETRO_MELONDS_DS_EMULATOR_INFO = melondsds.libretro.core.yml

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
$(eval $(emulator-info-package))
