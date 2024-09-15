################################################################################
#
# libretro-pcsx2
#
################################################################################
# Version: Commits on Apr 26, 2023
LIBRETRO_PCSX2_VERSION = 5112943bbe90cba420b5e8526297e2d12b881905
LIBRETRO_PCSX2_BRANCH = libretro
LIBRETRO_PCSX2_SITE = https://github.com/libretro/pcsx2.git
LIBRETRO_PCSX2_SITE_METHOD = git
LIBRETRO_PCSX2_GIT_SUBMODULES = YES
LIBRETRO_PCSX2_SUPPORTS_IN_SOURCE_BUILD = NO

LIBRETRO_PCSX2_LICENSE = GPLv2
LIBRETRO_PCSX2_DEPENDENCIES = libaio xz host-xxd

ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_X86_64_ANY),y)
LIBRETRO_PCSX2_DEPENDENCIES += libglvnd
endif

LIBRETRO_PCSX2_CONF_OPTS += -DBUILD_SHARED_LIBS=OFF
LIBRETRO_PCSX2_CONF_OPTS += -DLIBRETRO=ON
LIBRETRO_PCSX2_CONF_OPTS += -DUSE_VULKAN=ON

define LIBRETRO_PCSX2_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/lib/libretro
	$(INSTALL) -D $(@D)/buildroot-build/bin/pcsx2_libretro.so $(TARGET_DIR)/usr/lib/libretro/pcsx2_libretro.so
endef

$(eval $(cmake-package))
