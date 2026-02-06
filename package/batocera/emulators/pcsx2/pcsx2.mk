################################################################################
#
# pcsx2
#
################################################################################
# Version: Commits on Feb 06, 2026
PCSX2_VERSION = v2.7.97
PCSX2_HASH = df817924e0f1d21e75c5d451821179b94fb66004
PCSX2_SITE = https://github.com/pcsx2/pcsx2.git
PCSX2_SITE_METHOD = git
PCSX2_GIT_SUBMODULES = YES
PCSX2_LICENSE = GPLv3
PCSX2_LICENSE_FILE = COPYING.GPLv3
PCSX2_SUPPORTS_IN_SOURCE_BUILD = NO
PCSX2_EMULATOR_INFO = pcsx2.emulator.yml

PCSX2_GIT_TAG_HI = $(shell echo $(subst v,,$(PCSX2_VERSION)) | cut -d '.' -f 1)
PCSX2_GIT_TAG_MID = $(shell echo $(subst v,,$(PCSX2_VERSION)) | cut -d '.' -f 2)
PCSX2_GIT_TAG_LO = $(shell echo $(subst v,,$(PCSX2_VERSION)) | cut -d '.' -f 3)

PCSX2_DEPENDENCIES += alsa-lib ecm fmt freetype kddocwidgets libaio libbacktrace libcurl libgtk3 libpcap
PCSX2_DEPENDENCIES += libpng libsamplerate libsoundtouch plutosvg plutovg
PCSX2_DEPENDENCIES += qt6base qt6svg qt6tools portaudio sdl3 shaderc webp xorgproto yaml-cpp zlib
PCSX2_DEPENDENCIES += host-clang

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

ifeq ($(BR2_PACKAGE_BATOCERA_VULKAN),y)
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

define PCSX2_TEXTURES
	cp -pr $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/pcsx2/textures/    $(TARGET_DIR)/usr/bin/pcsx2/resources/
endef

define PCSX2_PATCHES
	mkdir -p $(TARGET_DIR)/usr/share/batocera/datainit/bios/ps2
	curl -L https://github.com/PCSX2/pcsx2_patches/releases/download/latest/patches.zip -o $(TARGET_DIR)/usr/bin/pcsx2/resources/patches.zip
endef

define PCSX2_CROSSHAIRS
	cp -pr $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/pcsx2/crosshairs/    $(TARGET_DIR)/usr/bin/pcsx2/resources/
endef

define PCSX2_RETROACHIEVEMENTS
	sed -i "s|GIT_TAGGED_COMMIT|1|" $(@D)/pcsx2/BuildVersion.cpp
	sed -i "s|GIT_TAG_HI|$(PCSX2_GIT_TAG_HI)|" $(@D)/pcsx2/BuildVersion.cpp
	sed -i "s|GIT_TAG_MID|$(PCSX2_GIT_TAG_MID)|" $(@D)/pcsx2/BuildVersion.cpp
	sed -i "s|GIT_TAG_LO|$(PCSX2_GIT_TAG_LO)|" $(@D)/pcsx2/BuildVersion.cpp
	sed -i 's|GIT_TAG|"$(PCSX2_VERSION)"|' $(@D)/pcsx2/BuildVersion.cpp
	sed -i 's|GIT_REV|"$(PCSX2_VERSION)"|' $(@D)/pcsx2/BuildVersion.cpp
	sed -i 's|GIT_HASH|"$(PCSX2_HASH)"|' $(@D)/pcsx2/BuildVersion.cpp
endef

PCSX2_POST_INSTALL_TARGET_HOOKS += PCSX2_TEXTURES
PCSX2_POST_INSTALL_TARGET_HOOKS += PCSX2_PATCHES
PCSX2_POST_INSTALL_TARGET_HOOKS += PCSX2_CROSSHAIRS
PCSX2_PRE_PATCH_HOOKS += PCSX2_RETROACHIEVEMENTS

$(eval $(cmake-package))
$(eval $(emulator-info-package))
