################################################################################
#
# libretro-pcsx2
#
################################################################################
# Version: Commits on May 03, 2023 (branch@newrebasing)
LIBRETRO_PCSX2_VERSION = d86c52557863f27b2504bc9cba9b196790cb3cfd
LIBRETRO_PCSX2_SITE = https://github.com/libretro/pcsx2.git
LIBRETRO_PCSX2_SITE_METHOD = git
LIBRETRO_PCSX2_GIT_SUBMODULES = YES
LIBRETRO_PCSX2_SUPPORTS_IN_SOURCE_BUILD = NO
LIBRETRO_PCSX2_CMAKE_BACKEND = ninja

LIBRETRO_PCSX2_LICENSE = GPLv2
LIBRETRO_PCSX2_DEPENDENCIES = libaio xz host-xxd

LIBRETRO_PCSX2_CONF_OPTS = -DCMAKE_BUILD_TYPE=Release
LIBRETRO_PCSX2_CONF_OPTS += -DQT_BUILD=OFF
LIBRETRO_PCSX2_CONF_OPTS += -DUSE_VULKAN=ON
LIBRETRO_PCSX2_CONF_OPTS += -DLIBRETRO=ON

define LIBRETRO_PCSX2_INSTALL_TARGET_CMDS
	$(INSTALL) -D $(@D)/pcsx2/pcsx2_libretro.so \
		$(TARGET_DIR)/usr/lib/libretro/pcsx2_libretro.so
endef

$(eval $(cmake-package))
