################################################################################
#
# pcsx2
#
################################################################################
# Version: Commits on Nov 23, 2026
PCSX2_VERSION = v2.9.192
PCSX2_HASH = 3ab1052b17eebc1800871eb2a63211a05a8cd7f4
PCSX2_SITE = https://github.com/pcsx2/pcsx2.git
PCSX2_SITE_METHOD = git
PCSX2_GIT_SUBMODULES = YES
PCSX2_LICENSE = GPL-3.0
PCSX2_LICENSE_FILES = COPYING.GPLv3
PCSX2_SUPPORTS_IN_SOURCE_BUILD = NO
PCSX2_EMULATOR_INFO = pcsx2.emulator.yml

PCSX2_VERSION_PARTS = $(subst ., ,$(patsubst v%,%,$(PCSX2_VERSION)))
PCSX2_GIT_TAG_HI = $(word 1,$(PCSX2_VERSION_PARTS))
PCSX2_GIT_TAG_MID = $(word 2,$(PCSX2_VERSION_PARTS))
PCSX2_GIT_TAG_LO = $(word 3,$(PCSX2_VERSION_PARTS))

PCSX2_DEPENDENCIES += dbus ffmpeg fontconfig freetype jpeg kddockwidgets libbacktrace libcurl
PCSX2_DEPENDENCIES += libpcap libpng lz4 plutosvg plutovg rapidyaml sdl3 udev webp zlib zstd
PCSX2_DEPENDENCIES += qt6base qt6svg qt6tools
PCSX2_DEPENDENCIES += host-clang

# The bundled cubeb enables its ALSA and PulseAudio backends when the headers exist
ifeq ($(BR2_PACKAGE_ALSA_LIB),y)
    PCSX2_DEPENDENCIES += alsa-lib
endif

ifeq ($(BR2_PACKAGE_PULSEAUDIO),y)
    PCSX2_DEPENDENCIES += pulseaudio
endif

PCSX2_CONF_OPTS += -DBUILD_SHARED_LIBS=OFF
PCSX2_CONF_OPTS += -DENABLE_TESTS=OFF
PCSX2_CONF_OPTS += -DLTO_PCSX2_CORE=OFF
PCSX2_CONF_OPTS += -DUSE_BACKTRACE=ON

# The following flag is misleading and *needed* ON to avoid doing -march=native
PCSX2_CONF_OPTS += -DDISABLE_ADVANCE_SIMD=ON

ifeq ($(BR2_PACKAGE_XORG7),y)
    PCSX2_DEPENDENCIES += xlib_libX11 xlib_libXrandr
    PCSX2_CONF_OPTS += -DX11_API=ON
else
    PCSX2_CONF_OPTS += -DX11_API=OFF
endif

ifeq ($(BR2_PACKAGE_BATOCERA_WAYLAND),y)
    PCSX2_DEPENDENCIES += ecm wayland
    PCSX2_CONF_OPTS += -DWAYLAND_API=ON
else
    PCSX2_CONF_OPTS += -DWAYLAND_API=OFF
endif

ifeq ($(BR2_PACKAGE_HAS_LIBGL),y)
    PCSX2_DEPENDENCIES += libgl
    PCSX2_CONF_OPTS += -DUSE_OPENGL=ON
else
    PCSX2_CONF_OPTS += -DUSE_OPENGL=OFF
endif

ifeq ($(BR2_PACKAGE_BATOCERA_VULKAN),y)
    PCSX2_DEPENDENCIES += shaderc
    PCSX2_CONF_OPTS += -DUSE_VULKAN=ON
else
    PCSX2_CONF_OPTS += -DUSE_VULKAN=OFF
endif

# Fill in the version info upstream takes from git, RetroAchievements needs it
define PCSX2_SET_BUILD_VERSION
	sed -i \
		-e 's|GIT_TAGGED_COMMIT|1|' \
		-e 's|GIT_TAG_HI|$(PCSX2_GIT_TAG_HI)|' \
		-e 's|GIT_TAG_MID|$(PCSX2_GIT_TAG_MID)|' \
		-e 's|GIT_TAG_LO|$(PCSX2_GIT_TAG_LO)|' \
		-e 's|GIT_TAG|"$(PCSX2_VERSION)"|' \
		-e 's|GIT_REV|"$(PCSX2_VERSION)"|' \
		-e 's|GIT_HASH|"$(PCSX2_HASH)"|' \
		$(@D)/pcsx2/BuildVersion.cpp
endef
PCSX2_POST_PATCH_HOOKS += PCSX2_SET_BUILD_VERSION

# Replace $<LINK_LIBRARY:WHOLE_ARCHIVE,...> with plain linker flags
define PCSX2_FIX_WHOLE_ARCHIVE
	find $(@D) -name "CMakeLists.txt" -exec sed -i 's|.[<]LINK_LIBRARY:WHOLE_ARCHIVE,\([^>]*\)>|-Wl,--whole-archive \1 -Wl,--no-whole-archive|g' {} +
endef
PCSX2_PRE_CONFIGURE_HOOKS += PCSX2_FIX_WHOLE_ARCHIVE

define PCSX2_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 0755 $(@D)/buildroot-build/bin/pcsx2-qt $(TARGET_DIR)/usr/bin/pcsx2/pcsx2-qt
	rm -rf $(TARGET_DIR)/usr/bin/pcsx2/resources
	cp -pr $(@D)/buildroot-build/bin/resources $(TARGET_DIR)/usr/bin/pcsx2/
	cp -pr $(PCSX2_PKGDIR)/textures $(PCSX2_PKGDIR)/crosshairs $(TARGET_DIR)/usr/bin/pcsx2/resources/
	# use our SDL config
	rm -f $(TARGET_DIR)/usr/bin/pcsx2/resources/game_controller_db.txt
endef

# Game patches, shipped in the bios folder. -f makes a failed download fail the
# build instead of saving the error page as patches.zip.
define PCSX2_INSTALL_PATCHES
	mkdir -p $(TARGET_DIR)/usr/share/batocera/datainit/bios/ps2
	curl -fsSL --retry 3 -o $(TARGET_DIR)/usr/share/batocera/datainit/bios/ps2/patches.zip \
		https://github.com/PCSX2/pcsx2_patches/releases/download/latest/patches.zip
endef
PCSX2_POST_INSTALL_TARGET_HOOKS += PCSX2_INSTALL_PATCHES

$(eval $(cmake-package))
$(eval $(emulator-info-package))
