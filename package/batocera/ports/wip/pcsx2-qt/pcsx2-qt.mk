################################################################################
#
# pcsx2-qt
#
################################################################################
# Version: Commits on Apr 13, 2023
PCSX2_QT_VERSION = v1.7.4378
PCSX2_QT_SITE = https://github.com/pcsx2/pcsx2.git
PCSX2_QT_SITE_METHOD = git
PCSX2_QT_GIT_SUBMODULES = YES
PCSX2_QT_LICENSE = GPLv3
PCSX2_QT_LICENSE_FILE = COPYING.GPLv3

PCSX2_QT_SUPPORTS_IN_SOURCE_BUILD = NO

PCSX2_QT_DEPENDENCIES += xserver_xorg-server alsa-lib freetype zlib libpng
PCSX2_QT_DEPENDENCIES += libaio portaudio libsoundtouch sdl2 libpcap yaml-cpp
PCSX2_QT_DEPENDENCIES += libsamplerate fmt libgtk3
PCSX2_QT_DEPENDENCIES += qt6base qt6svg qt6tools

PCSX2_QT_CONF_OPTS += -DCMAKE_BUILD_TYPE=Release
PCSX2_QT_CONF_OPTS += -DBUILD_SHARED_LIBS=OFF
PCSX2_QT_CONF_OPTS += -DCMAKE_INTERPROCEDURAL_OPTIMIZATION=TRUE
PCSX2_QT_CONF_OPTS += -DPACKAGE_MODE=FALSE
PCSX2_QT_CONF_OPTS += -DENABLE_TESTS=OFF
PCSX2_QT_CONF_OPTS += -DUSE_SYSTEM_LIBS=AUTO
PCSX2_QT_CONF_OPTS += -DDISABLE_ADVANCE_SIMD=ON
PCSX2_QT_CONF_OPTS += -DUSE_VTUNE=OFF
PCSX2_QT_CONF_OPTS += -DUSE_DISCORD_PRESENCE=OFF
PCSX2_QT_CONF_OPTS += -DUSE_ACHIEVEMENTS=OFF

ifeq ($(BR2_PACKAGE_XORG7),y)
    PCSX2_QT_CONF_OPTS += -DX11_API=ON
else
    PCSX2_QT_CONF_OPTS += -DX11_API=OFF
endif

ifeq ($(BR2_PACKAGE_BATOCERA_WAYLAND),y)
    PCSX2_QT_CONF_OPTS += -DWAYLAND_API=ON
else
    PCSX2_QT_CONF_OPTS += -DWAYLAND_API=OFF
endif

ifeq ($(BR2_PACKAGE_HAS_LIBGL),y)
    PCSX2_QT_CONF_OPTS += -DUSE_OPENGL=ON
else
    PCSX2_QT_CONF_OPTS += -DUSE_OPENGL=OFF
endif

ifeq ($(BR2_PACKAGE_VULKAN_HEADERS)$(BR2_PACKAGE_VULKAN_LOADER),yy)
    PCSX2_QT_CONF_OPTS += -DUSE_VULKAN=ON
else
    PCSX2_QT_CONF_OPTS += -DUSE_VULKAN=OFF
endif

define PCSX2_QT_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/pcsx2-qt/bin
	$(INSTALL) -m 0755 -D $(@D)/buildroot-build/bin/pcsx2-qt $(TARGET_DIR)/usr/pcsx2-qt/bin/
	cp -pr  $(@D)/buildroot-build/bin/resources $(TARGET_DIR)/usr/pcsx2-qt/bin/
endef

define PCSX2_QT_EVMAPY
	mkdir -p $(TARGET_DIR)/usr/share/evmapy
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/pcsx2/ps2.pcsx2.keys $(TARGET_DIR)/usr/share/evmapy
endef

PCSX2_QT_POST_INSTALL_TARGET_HOOKS += PCSX2_QT_EVMAPY

$(eval $(cmake-package))