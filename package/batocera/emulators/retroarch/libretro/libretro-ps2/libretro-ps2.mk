################################################################################
#
# libretro-ps2
#
################################################################################
# Version: Commits on Feb 06, 2026
LIBRETRO_PS2_VERSION = 416291ad7dc3caf5df4501c9249cbbe30cbef811
LIBRETRO_PS2_SITE = https://github.com/libretro/ps2.git
LIBRETRO_PS2_SITE_METHOD = git
LIBRETRO_PS2_GIT_SUBMODULES = YES
LIBRETRO_PS2_LICENSE = GPLv2
LIBRETRO_PS2_DEPENDENCIES = libaio xz host-xxd retroarch
LIBRETRO_PS2_EMULATOR_INFO = pcsx2.libretro.core.yml
LIBRETRO_PS2_SUPPORTS_IN_SOURCE_BUILD = NO

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
	mkdir -p $(TARGET_DIR)/usr/share/batocera/datainit/bios/pcsx2/resources
	$(INSTALL) -D $(@D)/buildroot-build/bin/pcsx2_libretro.so	$(TARGET_DIR)/usr/lib/libretro/ps2_libretro.so
	cp -f $(@D)/bin/resources/GameIndex.yaml					$(TARGET_DIR)/usr/share/batocera/datainit/bios/pcsx2/resources
endef

$(eval $(cmake-package))
$(eval $(emulator-info-package))
