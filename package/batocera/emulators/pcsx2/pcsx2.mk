################################################################################
#
# pcsx2
#
################################################################################
# Version: Commits on May 25, 2024
PCSX2_VERSION = 2d127039e180f617b3138069115e33e456051e64
PCSX2_SITE = https://github.com/pcsx2/pcsx2.git
PCSX2_SITE_METHOD = git
PCSX2_GIT_SUBMODULES = YES
PCSX2_LICENSE = GPLv3
PCSX2_LICENSE_FILE = COPYING.GPLv3
PCSX2_SUPPORTS_IN_SOURCE_BUILD = NO

PCSX2_DEPENDENCIES += xorgproto alsa-lib freetype zlib libpng shaderc
PCSX2_DEPENDENCIES += libaio portaudio libsoundtouch sdl2 libpcap yaml-cpp
PCSX2_DEPENDENCIES += libsamplerate fmt wxwidgets libgtk3 qt6base qt6tools qt6svg

PCSX2_CONF_OPTS += -DBUILD_SHARED_LIBS=OFF
PCSX2_CONF_OPTS += -DUSE_SYSTEM_LIBS=AUTO
PCSX2_CONF_OPTS += -DUSE_DISCORD_PRESENCE=OFF
PCSX2_CONF_OPTS += -DLTO_PCSX2_CORE=OFF
PCSX2_CONF_OPTS += -DUSE_ACHIEVEMENTS=ON
# The following flag is misleading and *needed* ON to avoid doing -march=native
PCSX2_CONF_OPTS += -DDISABLE_ADVANCE_SIMD=ON

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

define PCSX2_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/bin/pcsx2
	$(INSTALL) -m 0755 -D $(@D)/buildroot-build/bin/pcsx2-qt $(TARGET_DIR)/usr/bin/pcsx2/pcsx2
	cp -pr  $(@D)/buildroot-build/bin/resources $(TARGET_DIR)/usr/bin/pcsx2
	# use our SDL config
	rm $(TARGET_DIR)/usr/bin/pcsx2/resources/game_controller_db.txt
endef

define PCSX2_EVMAPY
	mkdir -p $(TARGET_DIR)/usr/share/evmapy
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/pcsx2/ps2.pcsx2.keys $(TARGET_DIR)/usr/share/evmapy
endef

PCSX2_POST_INSTALL_TARGET_HOOKS += PCSX2_EVMAPY

define PCSX2_TEXTURES
	cp -pr $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/pcsx2/textures/	$(TARGET_DIR)/usr/bin/pcsx2/resources/
endef

define PCSX2_PATCHES
	mkdir -p $(TARGET_DIR)/usr/share/batocera/datainit/bios/ps2
	curl -L https://github.com/PCSX2/pcsx2_patches/releases/download/latest/patches.zip -o $(TARGET_DIR)/usr/bin/pcsx2/resources/patches.zip

endef

define PCSX2_CROSSHAIRS
	cp -pr $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/pcsx2/crosshairs/	$(TARGET_DIR)/usr/bin/pcsx2/resources/
endef

PCSX2_POST_INSTALL_TARGET_HOOKS += PCSX2_TEXTURES
PCSX2_POST_INSTALL_TARGET_HOOKS += PCSX2_PATCHES
PCSX2_POST_INSTALL_TARGET_HOOKS += PCSX2_CROSSHAIRS

$(eval $(cmake-package))
