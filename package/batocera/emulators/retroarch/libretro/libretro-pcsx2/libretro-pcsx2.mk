################################################################################
#
# libretro-pcsx2
#
################################################################################
# Version: Commits on Jan 12, 2025
LIBRETRO_PCSX2_VERSION = 71fa95214ea88cd004aa13d9c1a5cc4f03ae97b5
LIBRETRO_PCSX2_SITE = https://github.com/libretro/ps2.git
LIBRETRO_PCSX2_SITE_METHOD = git
LIBRETRO_PCSX2_GIT_SUBMODULES = YES
LIBRETRO_PCSX2_LICENSE = GPLv3
LIBRETRO_PCSX2_LICENSE_FILE = COPYING.GPLv3
LIBRETRO_PCSX2_SUPPORTS_IN_SOURCE_BUILD = NO

LIBRETRO_PCSX2_DEPENDENCIES = libaio xz host-xxd
LIBRETRO_PCSX2_DEPENDENCIES += alsa-lib fmt freetype libaio libbacktrace libcurl libgtk3 libpcap libpng libsamplerate libsoundtouch
LIBRETRO_PCSX2_DEPENDENCIES += portaudio sdl2 shaderc webp wxwidgets xorgproto yaml-cpp zlib
LIBRETRO_PCSX2_DEPENDENCIES += host-clang host-libcurl

LIBRETRO_PCSX2_CONF_OPTS += -DBUILD_SHARED_LIBS=OFF
LIBRETRO_PCSX2_CONF_OPTS += -DUSE_SYSTEM_LIBS=AUTO
LIBRETRO_PCSX2_CONF_OPTS += -DUSE_DISCORD_PRESENCE=OFF
LIBRETRO_PCSX2_CONF_OPTS += -DLTO_PCSX2_CORE=OFF
LIBRETRO_PCSX2_CONF_OPTS += -DUSE_ACHIEVEMENTS=ON

ifeq ($(BR2_PACKAGE_XORG7),y)
    LIBRETRO_PCSX2_CONF_OPTS += -DX11_API=ON
else
    LIBRETRO_PCSX2_CONF_OPTS += -DX11_API=OFF
endif

ifeq ($(BR2_PACKAGE_BATOCERA_WAYLAND),y)
    LIBRETRO_PCSX2_CONF_OPTS += -DWAYLAND_API=ON
else
    LIBRETRO_PCSX2_CONF_OPTS += -DWAYLAND_API=OFF
endif

ifeq ($(BR2_PACKAGE_HAS_LIBGL),y)
    LIBRETRO_PCSX2_CONF_OPTS += -DUSE_OPENGL=ON
else
    LIBRETRO_PCSX2_CONF_OPTS += -DUSE_OPENGL=OFF
endif

ifeq ($(BR2_PACKAGE_BATOCERA_VULKAN),y)
    LIBRETRO_PCSX2_CONF_OPTS += -DUSE_VULKAN=ON
else
    LIBRETRO_PCSX2_CONF_OPTS += -DUSE_VULKAN=OFF
endif

define LIBRETRO_PCSX2_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/lib/libretro
	$(INSTALL) -D $(@D)/buildroot-build/bin/pcsx2_libretro.so $(TARGET_DIR)/usr/lib/libretro/pcsx2_libretro.so
endef

$(eval $(cmake-package))
