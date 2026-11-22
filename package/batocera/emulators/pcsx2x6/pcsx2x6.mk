################################################################################
#
# pcsx2x6
#
################################################################################
# Version: Commits on Aug 18, 2026
PCSX2X6_VERSION = v0.2.22
PCSX2X6_HASH = 64f063a6351549b0de9c97971636b23360dbcdab
PCSX2X6_SITE = https://github.com/PS2Homebrew-arcade/pcsx2x6.git
PCSX2X6_SITE_METHOD = git
PCSX2X6_GIT_SUBMODULES = YES
PCSX2X6_LICENSE = GPL-3.0
PCSX2X6_LICENSE_FILES = COPYING.GPLv3
PCSX2X6_SUPPORTS_IN_SOURCE_BUILD = NO
PCSX2X6_EMULATOR_INFO = pcsx2x6.emulator.yml

PCSX2X6_VERSION_PARTS = $(subst ., ,$(patsubst v%,%,$(PCSX2X6_VERSION)))
PCSX2X6_GIT_TAG_HI = $(word 1,$(PCSX2X6_VERSION_PARTS))
PCSX2X6_GIT_TAG_MID = $(word 2,$(PCSX2X6_VERSION_PARTS))
PCSX2X6_GIT_TAG_LO = $(word 3,$(PCSX2X6_VERSION_PARTS))

PCSX2X6_DEPENDENCIES += dbus ffmpeg fontconfig freetype jpeg kddockwidgets libbacktrace libcurl
PCSX2X6_DEPENDENCIES += libpcap libpng lz4 plutosvg plutovg rapidyaml sdl3 udev webp zlib zstd
PCSX2X6_DEPENDENCIES += qt6base qt6svg qt6tools
PCSX2X6_DEPENDENCIES += host-clang

# The bundled cubeb enables its ALSA and PulseAudio backends when the headers exist
ifeq ($(BR2_PACKAGE_ALSA_LIB),y)
    PCSX2X6_DEPENDENCIES += alsa-lib
endif

ifeq ($(BR2_PACKAGE_PULSEAUDIO),y)
    PCSX2X6_DEPENDENCIES += pulseaudio
endif

PCSX2X6_CONF_OPTS += -DBUILD_SHARED_LIBS=OFF
PCSX2X6_CONF_OPTS += -DENABLE_TESTS=OFF
PCSX2X6_CONF_OPTS += -DLTO_PCSX2_CORE=OFF
PCSX2X6_CONF_OPTS += -DUSE_BACKTRACE=ON

# The following flag is misleading and *needed* ON to avoid doing -march=native
PCSX2X6_CONF_OPTS += -DDISABLE_ADVANCE_SIMD=ON

ifeq ($(BR2_PACKAGE_XORG7),y)
    PCSX2X6_DEPENDENCIES += xlib_libX11 xlib_libXrandr
    PCSX2X6_CONF_OPTS += -DX11_API=ON
else
    PCSX2X6_CONF_OPTS += -DX11_API=OFF
endif

ifeq ($(BR2_PACKAGE_BATOCERA_WAYLAND),y)
    PCSX2X6_DEPENDENCIES += ecm wayland
    PCSX2X6_CONF_OPTS += -DWAYLAND_API=ON
else
    PCSX2X6_CONF_OPTS += -DWAYLAND_API=OFF
endif

ifeq ($(BR2_PACKAGE_HAS_LIBGL),y)
    PCSX2X6_DEPENDENCIES += libgl
    PCSX2X6_CONF_OPTS += -DUSE_OPENGL=ON
else
    PCSX2X6_CONF_OPTS += -DUSE_OPENGL=OFF
endif

ifeq ($(BR2_PACKAGE_BATOCERA_VULKAN),y)
    PCSX2X6_DEPENDENCIES += shaderc
    PCSX2X6_CONF_OPTS += -DUSE_VULKAN=ON
else
    PCSX2X6_CONF_OPTS += -DUSE_VULKAN=OFF
endif

# Fill in the version info upstream takes from git, RetroAchievements needs it
define PCSX2X6_SET_BUILD_VERSION
	sed -i \
		-e 's|GIT_TAGGED_COMMIT|1|' \
		-e 's|GIT_TAG_HI|$(PCSX2X6_GIT_TAG_HI)|' \
		-e 's|GIT_TAG_MID|$(PCSX2X6_GIT_TAG_MID)|' \
		-e 's|GIT_TAG_LO|$(PCSX2X6_GIT_TAG_LO)|' \
		-e 's|GIT_TAG|"$(PCSX2X6_VERSION)"|' \
		-e 's|GIT_REV|"$(PCSX2X6_VERSION)"|' \
		-e 's|GIT_HASH|"$(PCSX2X6_HASH)"|' \
		$(@D)/pcsx2/BuildVersion.cpp
endef
PCSX2X6_POST_PATCH_HOOKS += PCSX2X6_SET_BUILD_VERSION

# Replace $<LINK_LIBRARY:WHOLE_ARCHIVE,...> with plain linker flags
define PCSX2X6_FIX_WHOLE_ARCHIVE
	find $(@D) -name "CMakeLists.txt" -exec sed -i 's|.[<]LINK_LIBRARY:WHOLE_ARCHIVE,\([^>]*\)>|-Wl,--whole-archive \1 -Wl,--no-whole-archive|g' {} +
endef
PCSX2X6_PRE_CONFIGURE_HOOKS += PCSX2X6_FIX_WHOLE_ARCHIVE

define PCSX2X6_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 0755 $(@D)/buildroot-build/bin/pcsx2-qt $(TARGET_DIR)/usr/bin/pcsx2x6/pcsx2x6-qt
	rm -rf $(TARGET_DIR)/usr/bin/pcsx2x6/resources
	cp -pr $(@D)/buildroot-build/bin/resources $(TARGET_DIR)/usr/bin/pcsx2x6/
	cp -pr $(PCSX2X6_PKGDIR)/crosshairs $(TARGET_DIR)/usr/bin/pcsx2x6/resources/
	# use our SDL config
	rm -f $(TARGET_DIR)/usr/bin/pcsx2x6/resources/game_controller_db.txt
endef

# Game patches, shipped in the bios folder. -f makes a failed download fail the
# build instead of saving the error page as patches.zip.
define PCSX2X6_INSTALL_PATCHES
	mkdir -p $(TARGET_DIR)/usr/share/batocera/datainit/bios/namco2x6
	curl -fsSL --retry 3 -o $(TARGET_DIR)/usr/share/batocera/datainit/bios/namco2x6/patches.zip \
		https://github.com/PS2Homebrew-arcade/pcsx2x6_patches/releases/download/latest/patches.zip
endef
PCSX2X6_POST_INSTALL_TARGET_HOOKS += PCSX2X6_INSTALL_PATCHES

$(eval $(cmake-package))
$(eval $(emulator-info-package))
