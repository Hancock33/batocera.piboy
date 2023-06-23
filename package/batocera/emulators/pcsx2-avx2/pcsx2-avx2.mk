################################################################################
#
# pcsx2-avx2
#
################################################################################
# Version: Commits on Jun 23, 2023
PCSX2_AVX2_VERSION = cd4d829f9f22a8c2ddfbc360413e170a852bbaa1
PCSX2_AVX2_SOURCE = pcsx2-$(PCSX2_AVX2_VERSION)-br1.tar.gz
PCSX2_AVX2_SITE = https://github.com/pcsx2/pcsx2.git
PCSX2_AVX2_SITE_METHOD = git
PCSX2_AVX2_GIT_SUBMODULES = YES
PCSX2_AVX2_LICENSE = GPLv3
PCSX2_AVX2_LICENSE_FILE = COPYING.GPLv3

PCSX2_AVX2_SUPPORTS_IN_SOURCE_BUILD = NO

PCSX2_AVX2_DEPENDENCIES += xserver_xorg-server alsa-lib freetype zlib libpng
PCSX2_AVX2_DEPENDENCIES += libaio portaudio libsoundtouch sdl2 libpcap yaml-cpp host-ninja
PCSX2_AVX2_DEPENDENCIES += libsamplerate fmt libgtk3
PCSX2_AVX2_DEPENDENCIES += qt6base qt6svg qt6tools

PCSX2_AVX2_CONF_OPTS += -DCMAKE_BUILD_TYPE=Release
PCSX2_AVX2_CONF_OPTS += -DBUILD_SHARED_LIBS=OFF
PCSX2_AVX2_CONF_OPTS += -DCMAKE_INTERPROCEDURAL_OPTIMIZATION=TRUE
PCSX2_AVX2_CONF_OPTS += -DPACKAGE_MODE=FALSE
PCSX2_AVX2_CONF_OPTS += -DENABLE_TESTS=OFF
PCSX2_AVX2_CONF_OPTS += -DUSE_SYSTEM_LIBS=AUTO
PCSX2_AVX2_CONF_OPTS += -DDISABLE_ADVANCE_SIMD=OFF
PCSX2_AVX2_CONF_OPTS += -DUSE_VTUNE=OFF
PCSX2_AVX2_CONF_OPTS += -DUSE_DISCORD_PRESENCE=OFF
PCSX2_AVX2_CONF_OPTS += -DUSE_ACHIEVEMENTS=ON
PCSX2_AVX2_CONF_OPTS += -GNinja

ifeq ($(BR2_PACKAGE_XORG7),y)
    PCSX2_AVX2_CONF_OPTS += -DX11_API=ON
else
    PCSX2_AVX2_CONF_OPTS += -DX11_API=OFF
endif

ifeq ($(BR2_PACKAGE_BATOCERA_WAYLAND),y)
    PCSX2_AVX2_CONF_OPTS += -DWAYLAND_API=ON
else
    PCSX2_AVX2_CONF_OPTS += -DWAYLAND_API=OFF
endif

ifeq ($(BR2_PACKAGE_HAS_LIBGL),y)
    PCSX2_AVX2_CONF_OPTS += -DUSE_OPENGL=ON
else
    PCSX2_AVX2_CONF_OPTS += -DUSE_OPENGL=OFF
endif

ifeq ($(BR2_PACKAGE_VULKAN_HEADERS)$(BR2_PACKAGE_VULKAN_LOADER),yy)
    PCSX2_AVX2_CONF_OPTS += -DUSE_VULKAN=ON
else
    PCSX2_AVX2_CONF_OPTS += -DUSE_VULKAN=OFF
endif

define PCSX2_AVX2_BUILD_CMDS
	$(TARGET_MAKE_ENV) $(BR2_CMAKE) --build $(PCSX2_AVX2_BUILDDIR)
endef

define PCSX2_AVX2_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/pcsx2/bin
	$(INSTALL) -m 0755 -D $(@D)/buildroot-build/bin/pcsx2-qt $(TARGET_DIR)/usr/pcsx2-avx2/bin/pcsx2
	ln -sf /usr/pcsx2/bin/resources $(TARGET_DIR)/usr/pcsx2-avx2/bin/
endef

define PCSX2_AVX2_EVMAPY
	mkdir -p $(TARGET_DIR)/usr/share/evmapy
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/pcsx2/ps2.pcsx2.keys $(TARGET_DIR)/usr/share/evmapy
endef

PCSX2_AVX2_POST_INSTALL_TARGET_HOOKS += PCSX2_AVX2_EVMAPY

$(eval $(cmake-package))
