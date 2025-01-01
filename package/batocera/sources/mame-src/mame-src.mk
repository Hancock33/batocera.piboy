################################################################################
#
# mame-src
#
################################################################################
# Version: Commits on Dec 31, 2024
MAME_SRC_VERSION = mame0273
MAME_SRC_SITE = $(call github,mamedev,mame,$(MAME_SRC_VERSION))
MAME_SRC_DEPENDENCIES = sdl2 sdl2_ttf zlib libpng fontconfig sqlite jpeg flac rapidjson expat glm pulseaudio
MAME_SRC_LICENSE = MAME

MAME_SRC_CROSS_ARCH = unknown
MAME_SRC_CROSS_OPTS = PRECOMPILE=0
MAME_SRC_LDFLAGS = -fuse-ld=mold

# Limit number of jobs not to eat too much RAM....
MAME_SRC_JOBS = $(shell expr $(shell nproc))
# x86_64 is desktop linux based on X11 and OpenGL
ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_X86_64_ANY),y)
MAME_SRC_CROSS_ARCH = x86_64
MAME_SRC_CROSS_OPTS += PTR64=1
else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_BCM2711),y)
# other archs are embedded, no X11, no OpenGL (only ES)
else
MAME_SRC_CROSS_OPTS += NO_X11=1 NO_OPENGL=1 NO_USE_XINPUT=1 NO_USE_BGFX_KHRONOS=1 FORCE_DRC_C_BACKEND=1
endif

# Wayland
ifeq ($(BR2_PACKAGE_BATOCERA_WAYLAND),y)
MAME_SRC_CROSS_OPTS += USE_WAYLAND=1
else
MAME_SRC_CROSS_OPTS += USE_WAYLAND=0
endif

# allow cross-architecture compilation with MAME build system
ifeq ($(BR2_aarch64),y)
MAME_SRC_CROSS_ARCH = arm64
MAME_SRC_CROSS_OPTS += PTR64=1
MAME_SRC_CFLAGS += -DEGL_NO_X11=1
endif
ifeq ($(BR2_arm),y)
MAME_SRC_CROSS_ARCH = arm
MAME_SRC_CROSS_OPTS += PTR64=0
# Always enable NEON on 32-bit arm
MAME_SRC_CFLAGS += -D__ARM_NEON__ -D__ARM_NEON -DEGL_NO_X11=1
endif

ifeq ($(BR2_cortex_a9),y)
MAME_SRC_CFLAGS += -mcpu=cortex-a9 -mtune=cortex-a9 -mfloat-abi=hard
endif

ifeq ($(BR2_cortex_a35),y)
MAME_SRC_CFLAGS += -mcpu=cortex-a35 -mtune=cortex-a35
endif

ifeq ($(BR2_cortex_a17),y)
MAME_SRC_CFLAGS += -mcpu=cortex-a17 -mtune=cortex-a17 -mfloat-abi=hard
endif

ifeq ($(BR2_cortex_a55),y)
MAME_SRC_CFLAGS += -mcpu=cortex-a55 -mtune=cortex-a55
endif

ifeq ($(BR2_cortex_a73_a53),y)
MAME_SRC_CFLAGS += -mcpu=cortex-a73.cortex-a53 -mtune=cortex-a73.cortex-a53
endif

ifeq ($(BR2_cortex_a76_a55),y)
MAME_SRC_CFLAGS += -mcpu=cortex-a76.cortex-a55 -mtune=cortex-a76.cortex-a55
endif

define MAME_SRC_BUILD_CMDS
	# First, we need to build genie for host
	cd $(@D); \
	PATH="$(HOST_DIR)/bin:$$PATH" \
	$(MAKE) TARGETOS=linux OSD=sdl genie \
	TARGET=mame SUBTARGET=tiny \
	NO_USE_PORTAUDIO=1 NO_X11=1 USE_SDL=0 \
	USE_QTDEBUG=0 DEBUG=0 IGNORE_GIT=1 MPARAM=""

	# Compile emulation target (MAME)
	cd $(@D); \
	PATH="$(HOST_DIR)/bin:$$PATH" \
	SYSROOT="$(STAGING_DIR)" \
	LDFLAGS="--sysroot=$(STAGING_DIR) $(MAME_SRC_LDFLAGS)" \
	PKG_CONFIG="$(HOST_DIR)/bin/pkg-config --define-prefix" \
	PKG_CONFIG_PATH="$(STAGING_DIR)/usr/lib/pkgconfig" \
	CCACHE_SLOPPINESS="pch_defines,time_macros" \
	$(MAKE) -j$(MAME_SRC_JOBS) TARGETOS=linux OSD=sdl \
	TARGET=mame \
	SUBTARGET=mame \
	OVERRIDE_CC="$(TARGET_CC)" \
	OVERRIDE_CXX="$(TARGET_CXX)" \
	OVERRIDE_LD="$(TARGET_LD)" \
	OVERRIDE_AR="$(TARGET_AR)" \
	OVERRIDE_STRIP="$(TARGET_STRIP)" \
	CROSS_BUILD=1 \
	CROSS_ARCH="$(MAME_SRC_CROSS_ARCH)" \
	$(MAME_SRC_CROSS_OPTS) \
	NO_USE_PORTAUDIO=1 \
	USE_SYSTEM_LIB_ZLIB=1 \
	USE_SYSTEM_LIB_JPEG=1 \
	USE_SYSTEM_LIB_FLAC=1 \
	USE_SYSTEM_LIB_SQLITE3=1 \
	USE_SYSTEM_LIB_RAPIDJSON=1 \
	USE_SYSTEM_LIB_EXPAT=1 \
	USE_SYSTEM_LIB_GLM=1 \
	OPENMP=1 \
	SDL_INSTALL_ROOT="$(STAGING_DIR)/usr" USE_LIBSDL=1 \
	USE_QTDEBUG=0 DEBUG=0 IGNORE_GIT=1 \
	REGENIE=1 \
	LDOPTS="-lasound -lfontconfig" \
	SYMBOLS=0 \
	STRIP_SYMBOLS=1 \
	TOOLS=1 NOWERROR=1 OPTIMIZE=s OPT_FLAGS="$(TARGET_OPTIMIZATION)"
endef

define MAME_SRC_INSTALL_TARGET_CMDS
	# Create specific directories on target to store MAME distro
	rm -rf /tmp/mame
	mkdir -p /tmp/mame
	mkdir -p /tmp/mame/usr/bin/mame/
	mkdir -p /tmp/mame/usr/bin/mame/ctrlr
	mkdir -p /tmp/mame/usr/bin/mame/docs/legal
	mkdir -p /tmp/mame/usr/bin/mame/docs/man
	mkdir -p /tmp/mame/usr/bin/mame/docs/swlist
	mkdir -p /tmp/mame/usr/bin/mame/hash
	mkdir -p /tmp/mame/usr/bin/mame/ini/examples
	mkdir -p /tmp/mame/usr/bin/mame/ini/presets
	mkdir -p /tmp/mame/usr/bin/mame/language
	mkdir -p /tmp/mame/usr/bin/mame/roms

	# Install binaries and default distro
	$(INSTALL) -D $(@D)/mame	/tmp/mame/usr/bin/mame/mame
	cp $(@D)/COPYING			/tmp/mame/usr/bin/mame/
	cp $(@D)/README.md			/tmp/mame/usr/bin/mame/
	cp $(@D)/uismall.bdf		/tmp/mame/usr/bin/mame/
	cp -R $(@D)/artwork			/tmp/mame/usr/bin/mame/
	cp -R $(@D)/bgfx			/tmp/mame/usr/bin/mame/
	cp -R $(@D)/hash			/tmp/mame/usr/bin/mame/
	cp -R $(@D)/hlsl			/tmp/mame/usr/bin/mame/
	cp -R $(@D)/ini				/tmp/mame/usr/bin/mame/
	cp -R $(@D)/keymaps			/tmp/mame/usr/bin/mame/
	cp -R $(@D)/language		/tmp/mame/usr/bin/mame/
	cp -R -u $(@D)/plugins		/tmp/mame/usr/bin/mame/
	# Skip regression tests
	#cp -R $(@D)/regtests		/tmp/mame/usr/bin/mame/
	cp -R $(@D)/roms			/tmp/mame/usr/bin/mame/
	cp -R $(@D)/samples			/tmp/mame/usr/bin/mame/
	cp -R $(@D)/web				/tmp/mame/usr/bin/mame/

	# MAME tools
	$(INSTALL) -D $(@D)/castool		/tmp/mame/usr/bin/mame/
	$(INSTALL) -D $(@D)/chdman		/tmp/mame/usr/bin/mame/
	$(INSTALL) -D $(@D)/floptool	/tmp/mame/usr/bin/mame/
	$(INSTALL) -D $(@D)/imgtool		/tmp/mame/usr/bin/mame/
	$(INSTALL) -D $(@D)/jedutil		/tmp/mame/usr/bin/mame/
	$(INSTALL) -D $(@D)/ldresample	/tmp/mame/usr/bin/mame/
	$(INSTALL) -D $(@D)/ldverify	/tmp/mame/usr/bin/mame/
	$(INSTALL) -D $(@D)/romcmp		/tmp/mame/usr/bin/mame/

	# MAME dev tools skipped
	#$(INSTALL) -D $(@D)/unidasm	/tmp/mame/usr/bin/mame/
	#$(INSTALL) -D $(@D)/nltool		/tmp/mame/usr/bin/mame/
	#$(INSTALL) -D $(@D)/nlwav		/tmp/mame/usr/bin/mame/

	# Delete .po translation files
	find /tmp/mame/usr/bin/mame/language -name "*.po" -type f -delete

	# Delete bgfx shaders for DX9/DX11/Metal
	rm -Rf /tmp/mame/usr/bin/mame/bgfx/shaders/metal/
	rm -Rf /tmp/mame/usr/bin/mame/bgfx/shaders/dx11/

	cd /tmp/mame && tar -cf /tmp/mame-$(MAME_SRC_CROSS_ARCH)-$(subst mame,,$(MAME_SRC_VERSION)).tar .
	xz -T0 -7 -v /tmp/mame-$(MAME_SRC_CROSS_ARCH)-$(subst mame,,$(MAME_SRC_VERSION)).tar
	mv /tmp/mame-$(MAME_SRC_CROSS_ARCH)-$(subst mame,,$(MAME_SRC_VERSION)).tar.xz /mnt/smb
	rm -rf /tmp/mame*
endef

$(eval $(generic-package))
