################################################################################
#
# pcsx2
#
################################################################################
# Version: Commits on Jun 08, 2023
PCSX2_VERSION = 40bd19ccbb4a175644a1ff9c60474e85a41d6c85
PCSX2_SITE = https://github.com/pcsx2/pcsx2.git
PCSX2_SITE_METHOD = git
PCSX2_GIT_SUBMODULES = YES
PCSX2_LICENSE = GPLv3
PCSX2_LICENSE_FILE = COPYING.GPLv3

PCSX2_SUPPORTS_IN_SOURCE_BUILD = NO

PCSX2_DEPENDENCIES += xserver_xorg-server alsa-lib freetype zlib libpng
PCSX2_DEPENDENCIES += libaio portaudio libsoundtouch sdl2 libpcap yaml-cpp host-ninja
PCSX2_DEPENDENCIES += libsamplerate fmt libgtk3
PCSX2_DEPENDENCIES += qt6base qt6svg qt6tools

PCSX2_CONF_OPTS += -DCMAKE_BUILD_TYPE=Release
PCSX2_CONF_OPTS += -DBUILD_SHARED_LIBS=OFF
PCSX2_CONF_OPTS += -DCMAKE_INTERPROCEDURAL_OPTIMIZATION=TRUE
PCSX2_CONF_OPTS += -DPACKAGE_MODE=FALSE
PCSX2_CONF_OPTS += -DENABLE_TESTS=OFF
PCSX2_CONF_OPTS += -DUSE_SYSTEM_LIBS=AUTO
PCSX2_CONF_OPTS += -DDISABLE_ADVANCE_SIMD=ON
PCSX2_CONF_OPTS += -DUSE_VTUNE=OFF
PCSX2_CONF_OPTS += -DUSE_DISCORD_PRESENCE=OFF
PCSX2_CONF_OPTS += -DUSE_ACHIEVEMENTS=ON
PCSX2_CONF_OPTS += -GNinja

ifeq ($(BR2_PACKAGE_XORG7),y)
    PCSX2_CONF_OPTS += -DX11_API=ON
else
    PCSX2_CONF_OPTS += -DX11_API=OFF
endif

ifeq ($(BR2_PACKAGE_BATOCERA_WAYLAND),y)
    PCSX2_CONF_OPTS += -DWAYLAND_API=ON
else
    PCSX2_CONF_OPTS += -DWAYLAND_API=OFF
endif

ifeq ($(BR2_PACKAGE_HAS_LIBGL),y)
    PCSX2_CONF_OPTS += -DUSE_OPENGL=ON
else
    PCSX2_CONF_OPTS += -DUSE_OPENGL=OFF
endif

ifeq ($(BR2_PACKAGE_VULKAN_HEADERS)$(BR2_PACKAGE_VULKAN_LOADER),yy)
    PCSX2_CONF_OPTS += -DUSE_VULKAN=ON
else
    PCSX2_CONF_OPTS += -DUSE_VULKAN=OFF
endif

define PCSX2_BUILD_CMDS
	$(TARGET_MAKE_ENV) $(BR2_CMAKE) --build $(PCSX2_BUILDDIR)
endef

define PCSX2_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/pcsx2/bin
	$(INSTALL) -m 0755 -D $(@D)/buildroot-build/bin/pcsx2-qt $(TARGET_DIR)/usr/pcsx2/bin/pcsx2
	cp -pr  $(@D)/buildroot-build/bin/resources $(TARGET_DIR)/usr/pcsx2/bin/
endef

define PCSX2_EVMAPY
	mkdir -p $(TARGET_DIR)/usr/share/evmapy
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/pcsx2/ps2.pcsx2.keys $(TARGET_DIR)/usr/share/evmapy
endef

PCSX2_POST_INSTALL_TARGET_HOOKS += PCSX2_EVMAPY

define PCSX2_TEXTURES
	mkdir -p $(TARGET_DIR)/usr/pcsx2/bin/resources/textures
	cp -pr $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/pcsx2/textures/ $(TARGET_DIR)/usr/pcsx2/bin/resources/
	curl -L https://github.com/PCSX2/pcsx2_patches/releases/download/latest/patches.zip -o $(TARGET_DIR)/usr/pcsx2/bin/resources/patches.zip
endef

PCSX2_POST_INSTALL_TARGET_HOOKS += PCSX2_TEXTURES


$(eval $(cmake-package))
