################################################################################
#
# dolphin-emu
#
################################################################################
# Version: Commits on Nov 21, 2026
DOLPHIN_EMU_VERSION = a76221bc3109da6147d7e22b941c64712103dd6e
DOLPHIN_EMU_VERSION_MAJOR = 2609
DOLPHIN_EMU_VERSION_MINOR = 308
DOLPHIN_EMU_SITE = https://github.com/dolphin-emu/dolphin
DOLPHIN_EMU_SITE_METHOD = git
DOLPHIN_EMU_LICENSE = GPL-2.0+
DOLPHIN_EMU_GIT_SUBMODULES = YES
DOLPHIN_EMU_SUPPORTS_IN_SOURCE_BUILD = NO

DOLPHIN_EMU_DEPENDENCIES += bluez5_utils cubeb ffmpeg hidapi libcurl libevdev libusb lzo sdl3 udev xz zlib

ifeq ($(BR2_PACKAGE_ALSA_LIB),y)
    DOLPHIN_EMU_DEPENDENCIES += alsa-lib
endif

ifeq ($(BR2_PACKAGE_PULSEAUDIO),y)
    DOLPHIN_EMU_DEPENDENCIES += pulseaudio
endif

ifeq ($(BR2_PACKAGE_HAS_LIBGL),y)
    DOLPHIN_EMU_DEPENDENCIES += libgl
endif

ifeq ($(BR2_PACKAGE_HAS_LIBEGL),y)
    DOLPHIN_EMU_DEPENDENCIES += libegl
endif

$(eval $(call register,dolphin.emulator.yml))
$(eval $(call register-if-kconfig,BR2_PACKAGE_BATOCERA_VULKAN,gfxbackend.dolphin.emulator.yml))

DOLPHIN_EMU_CONF_OPTS += -DBUILD_SHARED_LIBS=OFF
DOLPHIN_EMU_CONF_OPTS += -DDISTRIBUTOR='batocera.linux'
DOLPHIN_EMU_CONF_OPTS += -DENABLE_ANALYTICS=OFF
DOLPHIN_EMU_CONF_OPTS += -DENABLE_AUTOUPDATE=OFF
DOLPHIN_EMU_CONF_OPTS += -DENABLE_CLI_TOOL=OFF
DOLPHIN_EMU_CONF_OPTS += -DENABLE_LTO=ON
DOLPHIN_EMU_CONF_OPTS += -DENABLE_TESTS=OFF
DOLPHIN_EMU_CONF_OPTS += -DUSE_DISCORD_PRESENCE=OFF
DOLPHIN_EMU_CONF_OPTS += -DUSE_MGBA=ON
DOLPHIN_EMU_CONF_OPTS += -DUSE_RETRO_ACHIEVEMENTS=ON
DOLPHIN_EMU_CONF_OPTS += -DUSE_SYSTEM_CUBEB=ON
DOLPHIN_EMU_CONF_OPTS += -DUSE_UPNP=OFF

ifeq ($(BR2_PACKAGE_QT6),y)
    DOLPHIN_EMU_DEPENDENCIES += qt6base qt6svg
    DOLPHIN_EMU_CONF_OPTS += -DENABLE_QT=ON
else
    DOLPHIN_EMU_CONF_OPTS += -DENABLE_QT=OFF
endif

ifeq ($(BR2_PACKAGE_XORG7),y)
    DOLPHIN_EMU_DEPENDENCIES += xlib_libX11 xlib_libXi xlib_libXrandr
    DOLPHIN_EMU_CONF_OPTS += -DENABLE_X11=ON
    DOLPHIN_EMU_CONF_OPTS += -DENABLE_NOGUI=ON
else
    DOLPHIN_EMU_CONF_OPTS += -DENABLE_X11=OFF
    DOLPHIN_EMU_CONF_OPTS += -DENABLE_NOGUI=OFF
endif

ifeq ($(BR2_PACKAGE_BATOCERA_VULKAN),y)
    DOLPHIN_EMU_CONF_OPTS += -DENABLE_VULKAN=ON
else
    DOLPHIN_EMU_CONF_OPTS += -DENABLE_VULKAN=OFF
endif

define DOLPHIN_EMU_PRE_CONFIGURE_HOOK
	sed -i 's/set(DOLPHIN_VERSION_MAJOR .*)/set(DOLPHIN_VERSION_MAJOR "$(DOLPHIN_EMU_VERSION_MAJOR)")/' $(@D)/CMake/ScmRevGen.cmake
	sed -i 's/set(DOLPHIN_VERSION_MINOR .*)/set(DOLPHIN_VERSION_MINOR "$(DOLPHIN_EMU_VERSION_MINOR)")/' $(@D)/CMake/ScmRevGen.cmake
endef

define DOLPHIN_EMU_INI
	# copy extra triforce ini files - force overwrite
	$(INSTALL) -m 0644 -D -t $(TARGET_DIR)/usr/share/dolphin-emu/Sys/GameSettings $(DOLPHIN_EMU_PKGDIR)/ini/*.ini
	cd $(TARGET_DIR)/usr/bin && ln -sf dolphin-emu dolphin-emu.desktopconfig
endef

DOLPHIN_EMU_PRE_CONFIGURE_HOOKS = DOLPHIN_EMU_PRE_CONFIGURE_HOOK
DOLPHIN_EMU_POST_INSTALL_TARGET_HOOKS += DOLPHIN_EMU_INI

$(eval $(cmake-package))
$(eval $(emulator-info-package))
