################################################################################
#
# mame-src
#
################################################################################
# Version: Commits on Jul 30, 2026
MAME_SRC_VERSION = mame0289
MAME_SRC_SITE = $(call github,mamedev,mame,$(MAME_SRC_VERSION))
MAME_SRC_DEPENDENCIES = alsa-lib asio expat flac fontconfig glm jpeg libpng libportmidi
MAME_SRC_DEPENDENCIES += portaudio pugixml rapidjson sdl2 sdl2_ttf sqlite zlib zstd
MAME_SRC_LICENSE = MAME

MAME_SRC_CROSS_ARCH = unknown
MAME_SRC_CROSS_OPTS = PRECOMPILE=1
MAME_SRC_CFLAGS += -I$(STAGING_DIR)/usr/include/pipewire-0.3 -I$(STAGING_DIR)/usr/include/spa-0.2 -I$(@D)/3rdparty/asio/include -pipe -w

# Follow BR2_JLEVEL (nproc + 1 when unset)
MAME_SRC_JOBS = $(PARALLEL_JOBS)

# Release tarball
MAME_SRC_DIST_DIR = $(@D)/batocera-dist
MAME_SRC_TARBALL = mame-$(MAME_SRC_CROSS_ARCH)-$(subst mame,,$(MAME_SRC_VERSION)).tar.xz

ifeq ($(BR2_x86_64),y)
    MAME_SRC_EXTRA_ARGS += PLATFORM=x86
    MAME_SRC_CROSS_ARCH = x86_64
else ifeq ($(BR2_aarch64),y)
    MAME_SRC_EXTRA_ARGS += PLATFORM=arm64
    MAME_SRC_CROSS_ARCH = aarch64
endif

# Wayland
ifeq ($(BR2_PACKAGE_BATOCERA_WAYLAND),y)
    MAME_SRC_CROSS_OPTS += USE_WAYLAND=1
else
    MAME_SRC_CROSS_OPTS += USE_WAYLAND=0
endif

# Disable OpenGL if we don't have it
ifneq ($(BR2_PACKAGE_HAS_LIBGL),y)
    MAME_SRC_CROSS_OPTS += NO_OPENGL=1 NO_USE_BGFX_KHRONOS=1
endif

# Handle alsa vs pulse/pipewire audio stack
ifeq ($(BR2_PACKAGE_PULSEAUDIO),y)
    MAME_SRC_DEPENDENCIES += pulseaudio
else
    MAME_SRC_CROSS_OPTS += NO_USE_PULSEAUDIO=1
endif

ifeq ($(BR2_PACKAGE_BATOCERA_QT6),y)
    MAME_SRC_CROSS_OPTS += QT_HOME="$(STAGING_DIR)/usr"
endif

define MAME_SRC_BUILD_CMDS
	# First, we need to build genie for host
	cd $(@D); \
	PATH="$(HOST_DIR)/bin:$$PATH" \
	$(MAKE) -j$(MAME_SRC_JOBS) TARGETOS=linux OSD=sdl genie \
	TARGET=mame SUBTARGET=tiny \
	NO_X11=1 USE_SDL=0 \
	USE_QTDEBUG=0 DEBUG=0 IGNORE_GIT=1 MPARAM=""

	# Compile emulation target (MAME)
	cd $(@D); \
	CCACHE_SLOPPINESS="pch_defines,time_macros,include_file_ctime,include_file_mtime" \
	CFLAGS="--sysroot=$(STAGING_DIR) $(MAME_SRC_CFLAGS)" \
	CXXFLAGS="--sysroot=$(STAGING_DIR) $(MAME_SRC_CFLAGS)" \
	LDFLAGS="$(TARGET_LDFLAGS) --sysroot=$(STAGING_DIR)" \
	PATH="$(HOST_DIR)/bin:$$PATH" \
	PKG_CONFIG_PATH="$(STAGING_DIR)/usr/lib/pkgconfig" \
	PKG_CONFIG="$(HOST_DIR)/bin/pkg-config --define-prefix" \
	SYSROOT="$(STAGING_DIR)" \
	$(MAKE) -j$(MAME_SRC_JOBS) TARGETOS=linux OSD=sdl \
	$(MAME_SRC_EXTRA_ARGS) \
	$(MAME_SRC_CROSS_OPTS) \
	ARCHOPTS=-fuse-ld=mold \
	LDOPTS="-lasound -lfontconfig" \
	NOWERROR=1 \
	OPENMP=0 \
	AR="$(HOST_DIR)/bin/llvm-ar" \
	CC="$(HOST_DIR)/bin/ccache $(HOST_DIR)/bin/clang" \
	CXX="$(HOST_DIR)/bin/ccache $(HOST_DIR)/bin/clang++" \
	LD="$(TARGET_LD)" \
	SDL_INSTALL_ROOT="$(STAGING_DIR)/usr" \
	SDL_PKGCONFIG_PATH="$(STAGING_DIR)/usr/lib/pkgconfig" \
	SUBTARGET=mame \
	TARGET=mame \
	TOOLS=1 \
	USE_QTDEBUG=0 DEBUG=0 IGNORE_GIT=1 \
	USE_SYSTEM_LIB_ASIO=1 \
	USE_SYSTEM_LIB_EXPAT=1 \
	USE_SYSTEM_LIB_FLAC=1 \
	USE_SYSTEM_LIB_GLM=1 \
	USE_SYSTEM_LIB_JPEG=1 \
	USE_SYSTEM_LIB_PORTAUDIO=1 \
	USE_SYSTEM_LIB_PORTMIDI=1 \
	USE_SYSTEM_LIB_PUGIXML=1 \
	USE_SYSTEM_LIB_RAPIDJSON=1 \
	USE_SYSTEM_LIB_SQLITE3=1 \
	USE_SYSTEM_LIB_ZLIB=1 \
	USE_SYSTEM_LIB_ZSTD=1 \
	OPTIMIZE=2 LTO=1 OPT_FLAGS=$(BR2_TARGET_OPTIMIZATION) PTR64=1
endef

define MAME_SRC_INSTALL_TARGET_CMDS
	# Create specific directories on target to store MAME distro
	rm -rf $(MAME_SRC_DIST_DIR)
	mkdir -p $(MAME_SRC_DIST_DIR)/usr/bin/mame/
	mkdir -p $(MAME_SRC_DIST_DIR)/usr/bin/mame/ctrlr
	mkdir -p $(MAME_SRC_DIST_DIR)/usr/bin/mame/docs/legal
	mkdir -p $(MAME_SRC_DIST_DIR)/usr/bin/mame/docs/man
	mkdir -p $(MAME_SRC_DIST_DIR)/usr/bin/mame/docs/swlist
	mkdir -p $(MAME_SRC_DIST_DIR)/usr/bin/mame/hash
	mkdir -p $(MAME_SRC_DIST_DIR)/usr/bin/mame/ini/examples
	mkdir -p $(MAME_SRC_DIST_DIR)/usr/bin/mame/ini/presets
	mkdir -p $(MAME_SRC_DIST_DIR)/usr/bin/mame/language
	mkdir -p $(MAME_SRC_DIST_DIR)/usr/bin/mame/roms

	# Install binaries and default distro
	$(INSTALL) -D $(@D)/mame	$(MAME_SRC_DIST_DIR)/usr/bin/mame/mame
	$(HOST_DIR)/bin/llvm-strip	$(MAME_SRC_DIST_DIR)/usr/bin/mame/mame
	cp $(@D)/COPYING			$(MAME_SRC_DIST_DIR)/usr/bin/mame/
	cp $(@D)/README.md			$(MAME_SRC_DIST_DIR)/usr/bin/mame/
	cp $(@D)/uismall.bdf		$(MAME_SRC_DIST_DIR)/usr/bin/mame/
	cp -R $(@D)/artwork			$(MAME_SRC_DIST_DIR)/usr/bin/mame/
	cp -R $(@D)/bgfx			$(MAME_SRC_DIST_DIR)/usr/bin/mame/
	cp -R $(@D)/hash			$(MAME_SRC_DIST_DIR)/usr/bin/mame/
	cp -R $(@D)/hlsl			$(MAME_SRC_DIST_DIR)/usr/bin/mame/
	cp -R $(@D)/ini				$(MAME_SRC_DIST_DIR)/usr/bin/mame/
	cp -R $(@D)/keymaps			$(MAME_SRC_DIST_DIR)/usr/bin/mame/
	cp -R $(@D)/language		$(MAME_SRC_DIST_DIR)/usr/bin/mame/
	cp -R -u $(@D)/plugins		$(MAME_SRC_DIST_DIR)/usr/bin/mame/
	cp -R $(@D)/roms			$(MAME_SRC_DIST_DIR)/usr/bin/mame/
	cp -R $(@D)/samples			$(MAME_SRC_DIST_DIR)/usr/bin/mame/
	cp -R $(@D)/web				$(MAME_SRC_DIST_DIR)/usr/bin/mame/

	# MAME tools
	$(INSTALL) -D $(@D)/castool		$(MAME_SRC_DIST_DIR)/usr/bin/mame/
	$(INSTALL) -D $(@D)/chdman		$(MAME_SRC_DIST_DIR)/usr/bin/mame/
	$(INSTALL) -D $(@D)/floptool	$(MAME_SRC_DIST_DIR)/usr/bin/mame/
	$(INSTALL) -D $(@D)/imgtool		$(MAME_SRC_DIST_DIR)/usr/bin/mame/
	$(INSTALL) -D $(@D)/jedutil		$(MAME_SRC_DIST_DIR)/usr/bin/mame/
	$(INSTALL) -D $(@D)/ldresample	$(MAME_SRC_DIST_DIR)/usr/bin/mame/
	$(INSTALL) -D $(@D)/ldverify	$(MAME_SRC_DIST_DIR)/usr/bin/mame/
	$(INSTALL) -D $(@D)/romcmp		$(MAME_SRC_DIST_DIR)/usr/bin/mame/
	$(HOST_DIR)/bin/llvm-strip		$(MAME_SRC_DIST_DIR)/usr/bin/mame/{castool,chdman,floptool,imgtool,jedutil,ldresample,ldverify,romcmp}

	# Delete .po translation files
	find $(MAME_SRC_DIST_DIR)/usr/bin/mame/language -name "*.po" -type f -delete

	# Delete bgfx shaders for DX9/DX11/Metal
	rm -Rf $(MAME_SRC_DIST_DIR)/usr/bin/mame/bgfx/shaders/metal/
	rm -Rf $(MAME_SRC_DIST_DIR)/usr/bin/mame/bgfx/shaders/dx*/

	# Pack (root-owned, streamed straight into xz) and publish
	set -o pipefail; \
	tar -C $(MAME_SRC_DIST_DIR) --owner=0 --group=0 --numeric-owner -cf - . | \
		xz -T0 -7 -v > $(@D)/$(MAME_SRC_TARBALL)
	mv $(@D)/$(MAME_SRC_TARBALL) /mnt/smb/
	rm -rf $(MAME_SRC_DIST_DIR)
endef

$(eval $(generic-package))
