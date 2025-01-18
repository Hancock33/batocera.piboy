################################################################################
#
# libretro-ps2
#
################################################################################
# Version: Commits on Jan 18, 2025
LIBRETRO_PS2_VERSION = d17956e2eb92ba324cfeea53847c73b7e5ba4800
LIBRETRO_PS2_SITE = https://github.com/libretro/ps2.git
LIBRETRO_PS2_SITE_METHOD = git
LIBRETRO_PS2_GIT_SUBMODULES = YES
LIBRETRO_PS2_LICENSE = GPLv3
LIBRETRO_PS2_LICENSE_FILE = COPYING.GPLv3
LIBRETRO_PS2_SUPPORTS_IN_SOURCE_BUILD = NO

LIBRETRO_PS2_DEPENDENCIES = libaio xz host-xxd
LIBRETRO_PS2_DEPENDENCIES += alsa-lib fmt freetype libaio libbacktrace libcurl libgtk3 libpcap libpng libsamplerate libsoundtouch
LIBRETRO_PS2_DEPENDENCIES += portaudio sdl2 shaderc webp wxwidgets xorgproto yaml-cpp zlib
LIBRETRO_PS2_DEPENDENCIES += host-clang host-libcurl

LIBRETRO_PS2_CONF_OPTS += -DBUILD_SHARED_LIBS=OFF
LIBRETRO_PS2_CONF_OPTS += -DUSE_SYSTEM_LIBS=AUTO
LIBRETRO_PS2_CONF_OPTS += -DUSE_DISCORD_PRESENCE=OFF
LIBRETRO_PS2_CONF_OPTS += -DLTO_PCSX2_CORE=OFF
LIBRETRO_PS2_CONF_OPTS += -DUSE_ACHIEVEMENTS=ON

ifeq ($(BR2_PACKAGE_XORG7),y)
    LIBRETRO_PS2_CONF_OPTS += -DX11_API=ON
else
    LIBRETRO_PS2_CONF_OPTS += -DX11_API=OFF
endif

ifeq ($(BR2_PACKAGE_BATOCERA_WAYLAND),y)
    LIBRETRO_PS2_CONF_OPTS += -DWAYLAND_API=ON
else
    LIBRETRO_PS2_CONF_OPTS += -DWAYLAND_API=OFF
endif

ifeq ($(BR2_PACKAGE_HAS_LIBGL),y)
    LIBRETRO_PS2_CONF_OPTS += -DUSE_OPENGL=ON
else
    LIBRETRO_PS2_CONF_OPTS += -DUSE_OPENGL=OFF
endif

ifeq ($(BR2_PACKAGE_BATOCERA_VULKAN),y)
    LIBRETRO_PS2_CONF_OPTS += -DUSE_VULKAN=ON
else
    LIBRETRO_PS2_CONF_OPTS += -DUSE_VULKAN=OFF
endif

define LIBRETRO_PS2_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/lib/libretro
	$(INSTALL) -D $(@D)/buildroot-build/bin/pcsx2_libretro.so $(TARGET_DIR)/usr/lib/libretro/pcsx2_libretro.so
endef

$(eval $(cmake-package))
