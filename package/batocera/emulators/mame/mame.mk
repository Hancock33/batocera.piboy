################################################################################
#
# mame
#
################################################################################
# Version: Commits on Aug 29, 2024
MAME_VERSION = mame0269
MAME_SITE = $(call github,mamedev,mame,$(MAME_VERSION))
MAME_DEPENDENCIES = sdl2 sdl2_ttf zlib libpng fontconfig sqlite jpeg flac rapidjson expat glm
MAME_LICENSE = MAME

MAME_CROSS_ARCH = unknown
MAME_CROSS_OPTS = PRECOMPILE=0
MAME_LDFLAGS = -fuse-ld=mold

# Limit number of jobs not to eat too much RAM....
MAME_JOBS = $(shell expr $(shell nproc))
# x86_64 is desktop linux based on X11 and OpenGL
ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_X86_64_ANY),y)
MAME_CROSS_ARCH = x86_64
MAME_CROSS_OPTS += PTR64=1
else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_BCM2711),y)
# other archs are embedded, no X11, no OpenGL (only ES)
else
MAME_CROSS_OPTS += NO_X11=1 NO_OPENGL=1 NO_USE_XINPUT=1 NO_USE_BGFX_KHRONOS=1 FORCE_DRC_C_BACKEND=1
endif

# allow cross-architecture compilation with MAME build system
ifeq ($(BR2_aarch64),y)
MAME_CROSS_ARCH = arm64
MAME_CROSS_OPTS += PTR64=1
MAME_CFLAGS += -DEGL_NO_X11=1
endif
ifeq ($(BR2_arm),y)
MAME_CROSS_ARCH = arm
MAME_CROSS_OPTS += PTR64=0
# Always enable NEON on 32-bit arm
MAME_CFLAGS += -D__ARM_NEON__ -D__ARM_NEON -DEGL_NO_X11=1
endif

ifeq ($(BR2_cortex_a9),y)
MAME_CFLAGS += -mcpu=cortex-a9 -mtune=cortex-a9 -mfloat-abi=hard
endif

ifeq ($(BR2_cortex_a35),y)
MAME_CFLAGS += -mcpu=cortex-a35 -mtune=cortex-a35
endif

ifeq ($(BR2_cortex_a17),y)
MAME_CFLAGS += -mcpu=cortex-a17 -mtune=cortex-a17 -mfloat-abi=hard
endif

ifeq ($(BR2_cortex_a55),y)
MAME_CFLAGS += -mcpu=cortex-a55 -mtune=cortex-a55
endif

ifeq ($(BR2_cortex_a73_a53),y)
MAME_CFLAGS += -mcpu=cortex-a73.cortex-a53 -mtune=cortex-a73.cortex-a53
endif

define MAME_BUILD_CMDS
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
	LDFLAGS="--sysroot=$(STAGING_DIR) $(MAME_LDFLAGS)" \
	PKG_CONFIG="$(HOST_DIR)/usr/bin/pkg-config --define-prefix" \
	PKG_CONFIG_PATH="$(STAGING_DIR)/usr/lib/pkgconfig" \
	CCACHE_SLOPPINESS="pch_defines,time_macros" \
	$(MAKE) -j$(MAME_JOBS) TARGETOS=linux OSD=sdl \
	TARGET=mame \
	SUBTARGET=mame \
	OVERRIDE_CC="$(TARGET_CC)" \
	OVERRIDE_CXX="$(TARGET_CXX)" \
	OVERRIDE_LD="$(TARGET_LD)" \
	OVERRIDE_AR="$(TARGET_AR)" \
	OVERRIDE_STRIP="$(TARGET_STRIP)" \
	CROSS_BUILD=1 \
	CROSS_ARCH="$(MAME_CROSS_ARCH)" \
	$(MAME_CROSS_OPTS) \
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

MAME_CONF_INIT = $(TARGET_DIR)/usr/share/batocera/datainit/system/configs/mame/

define MAME_INSTALL_TARGET_CMDS
	# Create specific directories on target to store MAME distro
	mkdir -p $(TARGET_DIR)/usr/bin/mame/
	mkdir -p $(TARGET_DIR)/usr/bin/mame/ctrlr
	mkdir -p $(TARGET_DIR)/usr/bin/mame/docs/legal
	mkdir -p $(TARGET_DIR)/usr/bin/mame/docs/man
	mkdir -p $(TARGET_DIR)/usr/bin/mame/docs/swlist
	mkdir -p $(TARGET_DIR)/usr/bin/mame/hash
	mkdir -p $(TARGET_DIR)/usr/bin/mame/ini/examples
	mkdir -p $(TARGET_DIR)/usr/bin/mame/ini/presets
	mkdir -p $(TARGET_DIR)/usr/bin/mame/language
	mkdir -p $(TARGET_DIR)/usr/bin/mame/roms

	# Install binaries and default distro
	$(INSTALL) -D $(@D)/mame	$(TARGET_DIR)/usr/bin/mame/mame
	cp $(@D)/COPYING			$(TARGET_DIR)/usr/bin/mame/
	cp $(@D)/README.md			$(TARGET_DIR)/usr/bin/mame/
	cp $(@D)/uismall.bdf		$(TARGET_DIR)/usr/bin/mame/
	cp -R $(@D)/artwork			$(TARGET_DIR)/usr/bin/mame/
	cp -R $(@D)/bgfx			$(TARGET_DIR)/usr/bin/mame/
	cp -R $(@D)/hash			$(TARGET_DIR)/usr/bin/mame/
	cp -R $(@D)/hlsl			$(TARGET_DIR)/usr/bin/mame/
	cp -R $(@D)/ini				$(TARGET_DIR)/usr/bin/mame/
	cp -R $(@D)/keymaps			$(TARGET_DIR)/usr/bin/mame/
	cp -R $(@D)/language		$(TARGET_DIR)/usr/bin/mame/
	cp -R -u $(@D)/plugins			$(TARGET_DIR)/usr/bin/mame/
	# Skip regression tests
	#cp -R $(@D)/regtests		$(TARGET_DIR)/usr/bin/mame/
	cp -R $(@D)/roms			$(TARGET_DIR)/usr/bin/mame/
	cp -R $(@D)/samples			$(TARGET_DIR)/usr/bin/mame/
	cp -R $(@D)/web				$(TARGET_DIR)/usr/bin/mame/

	# MAME tools
	$(INSTALL) -D $(@D)/castool		$(TARGET_DIR)/usr/bin/mame/
	$(INSTALL) -D $(@D)/chdman		$(TARGET_DIR)/usr/bin/mame/
	$(INSTALL) -D $(@D)/floptool	$(TARGET_DIR)/usr/bin/mame/
	$(INSTALL) -D $(@D)/imgtool		$(TARGET_DIR)/usr/bin/mame/
	$(INSTALL) -D $(@D)/jedutil		$(TARGET_DIR)/usr/bin/mame/
	$(INSTALL) -D $(@D)/ldresample	$(TARGET_DIR)/usr/bin/mame/
	$(INSTALL) -D $(@D)/ldverify	$(TARGET_DIR)/usr/bin/mame/
	$(INSTALL) -D $(@D)/romcmp		$(TARGET_DIR)/usr/bin/mame/

	# MAME dev tools skipped
	#$(INSTALL) -D $(@D)/unidasm	$(TARGET_DIR)/usr/bin/mame/
	#$(INSTALL) -D $(@D)/nltool		$(TARGET_DIR)/usr/bin/mame/
	#$(INSTALL) -D $(@D)/nlwav		$(TARGET_DIR)/usr/bin/mame/

	# Delete .po translation files
	find $(TARGET_DIR)/usr/bin/mame/language -name "*.po" -type f -delete

	# Delete bgfx shaders for DX9/DX11/Metal
	rm -Rf $(TARGET_DIR)/usr/bin/mame/bgfx/shaders/metal/
	rm -Rf $(TARGET_DIR)/usr/bin/mame/bgfx/shaders/dx11/

	# Copy extra bgfx shaders
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/mame/crt-geom-deluxe-rgb.json $(TARGET_DIR)/usr/bin/mame/bgfx/chains
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/mame/crt-geom-deluxe-composite.json $(TARGET_DIR)/usr/bin/mame/bgfx/chains

	# Copy blank disk image(s)
	mkdir -p $(TARGET_DIR)/usr/share/mame
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/mame/blank.fmtowns $(TARGET_DIR)/usr/share/mame/blank.fmtowns

	# Copy coin drop plugin
	cp -R -u $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/mame/coindrop $(TARGET_DIR)/usr/bin/mame/plugins

	# Copy data plugin information
	cp -R $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/mame/dats			$(TARGET_DIR)/usr/bin/mame/
	cp -R $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/mame/history			$(TARGET_DIR)/usr/bin/mame/

	# gameStop script when exiting a rotated screen
	mkdir -p $(TARGET_DIR)/usr/share/batocera/configgen/scripts
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/mame/rotation_fix.sh $(TARGET_DIR)/usr/share/batocera/configgen/scripts/rotation_fix.sh

	# Copy user -autoboot_command overrides (batocera.linux/batocera.linux#11706)
	mkdir -p $(MAME_CONF_INIT)/autoload
	cp -R $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/mame/autoload			$(MAME_CONF_INIT)
endef

define MAME_EVMAPY
	mkdir -p $(TARGET_DIR)/usr/share/evmapy
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/mame/mame.mame.keys $(TARGET_DIR)/usr/share/evmapy
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/mame/mame.mame.keys $(TARGET_DIR)/usr/share/evmapy/adam.mame.keys
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/mame/mame.mame.keys $(TARGET_DIR)/usr/share/evmapy/advision.mame.keys
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/mame/mame.mame.keys $(TARGET_DIR)/usr/share/evmapy/apfm1000.mame.keys
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/mame/mame.mame.keys $(TARGET_DIR)/usr/share/evmapy/apple2.mame.keys
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/mame/mame.mame.keys $(TARGET_DIR)/usr/share/evmapy/apple2gs.mame.keys
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/mame/mame.mame.keys $(TARGET_DIR)/usr/share/evmapy/arcadia.mame.keys
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/mame/mame.mame.keys $(TARGET_DIR)/usr/share/evmapy/archimedes.mame.keys
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/mame/mame.mame.keys $(TARGET_DIR)/usr/share/evmapy/astrocde.mame.keys
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/mame/mame.mame.keys $(TARGET_DIR)/usr/share/evmapy/atom.mame.keys
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/mame/mame.mame.keys $(TARGET_DIR)/usr/share/evmapy/bbc.mame.keys
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/mame/mame.mame.keys $(TARGET_DIR)/usr/share/evmapy/camplynx.mame.keys
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/mame/mame.mame.keys $(TARGET_DIR)/usr/share/evmapy/cdi.mame.keys
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/mame/mame.mame.keys $(TARGET_DIR)/usr/share/evmapy/coco.mame.keys
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/mame/mame.mame.keys $(TARGET_DIR)/usr/share/evmapy/crvision.mame.keys
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/mame/mame.mame.keys $(TARGET_DIR)/usr/share/evmapy/electron.mame.keys
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/mame/mame.mame.keys $(TARGET_DIR)/usr/share/evmapy/fm7.mame.keys
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/mame/mame.mame.keys $(TARGET_DIR)/usr/share/evmapy/fmtowns.mame.keys
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/mame/mame.mame.keys $(TARGET_DIR)/usr/share/evmapy/gamate.mame.keys
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/mame/mame.mame.keys $(TARGET_DIR)/usr/share/evmapy/gameandwatch.mame.keys
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/mame/mame.mame.keys $(TARGET_DIR)/usr/share/evmapy/gamecom.mame.keys
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/mame/mame.mame.keys $(TARGET_DIR)/usr/share/evmapy/gamepock.mame.keys
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/mame/mame.mame.keys $(TARGET_DIR)/usr/share/evmapy/gmaster.mame.keys
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/mame/mame.mame.keys $(TARGET_DIR)/usr/share/evmapy/gp32.mame.keys
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/mame/mame.mame.keys $(TARGET_DIR)/usr/share/evmapy/lcdgames.mame.keys
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/mame/mame.mame.keys $(TARGET_DIR)/usr/share/evmapy/laser310.mame.keys
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/mame/mame.mame.keys $(TARGET_DIR)/usr/share/evmapy/macintosh.mame.keys
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/mame/mame.mame.keys $(TARGET_DIR)/usr/share/evmapy/sameduck.mame.keys
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/mame/mame.mame.keys $(TARGET_DIR)/usr/share/evmapy/megaduck.mame.keys
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/mame/mame.mame.keys $(TARGET_DIR)/usr/share/evmapy/neogeo.mame.keys
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/mame/mame.mame.keys $(TARGET_DIR)/usr/share/evmapy/pdp1.mame.keys
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/mame/mame.mame.keys $(TARGET_DIR)/usr/share/evmapy/plugnplay.mame.keys
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/mame/mame.mame.keys $(TARGET_DIR)/usr/share/evmapy/pv1000.mame.keys
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/mame/mame.mame.keys $(TARGET_DIR)/usr/share/evmapy/socrates.mame.keys
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/mame/mame.mame.keys $(TARGET_DIR)/usr/share/evmapy/supracan.mame.keys
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/mame/mame.mame.keys $(TARGET_DIR)/usr/share/evmapy/ti99.mame.keys
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/mame/mame.mame.keys $(TARGET_DIR)/usr/share/evmapy/tutor.mame.keys
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/mame/mame.mame.keys $(TARGET_DIR)/usr/share/evmapy/vc4000.mame.keys
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/mame/mame.mame.keys $(TARGET_DIR)/usr/share/evmapy/vectrex.mame.keys
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/mame/mame.mame.keys $(TARGET_DIR)/usr/share/evmapy/vgmplay.mame.keys
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/mame/mame.mame.keys $(TARGET_DIR)/usr/share/evmapy/vsmile.mame.keys
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/mame/mame.mame.keys $(TARGET_DIR)/usr/share/evmapy/xegs.mame.keys

	# Arcade Systems
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/mame/mame.mame.keys $(TARGET_DIR)/usr/share/evmapy/acclaim.mame.keys
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/mame/mame.mame.keys $(TARGET_DIR)/usr/share/evmapy/alg.mame.keys
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/mame/mame.mame.keys $(TARGET_DIR)/usr/share/evmapy/alphadenshi.mame.keys
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/mame/mame.mame.keys $(TARGET_DIR)/usr/share/evmapy/amcoe.mame.keys
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/mame/mame.mame.keys $(TARGET_DIR)/usr/share/evmapy/atari.mame.keys
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/mame/mame.mame.keys $(TARGET_DIR)/usr/share/evmapy/atlus.mame.keys
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/mame/mame.mame.keys $(TARGET_DIR)/usr/share/evmapy/banpresto.mame.keys
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/mame/mame.mame.keys $(TARGET_DIR)/usr/share/evmapy/cave.mame.keys
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/mame/mame.mame.keys $(TARGET_DIR)/usr/share/evmapy/centurye.mame.keys
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/mame/mame.mame.keys $(TARGET_DIR)/usr/share/evmapy/cinematronics.mame.keys
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/mame/mame.mame.keys $(TARGET_DIR)/usr/share/evmapy/comad.mame.keys
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/mame/mame.mame.keys $(TARGET_DIR)/usr/share/evmapy/cps1.mame.keys
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/mame/mame.mame.keys $(TARGET_DIR)/usr/share/evmapy/cps2.mame.keys
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/mame/mame.mame.keys $(TARGET_DIR)/usr/share/evmapy/cps3.mame.keys
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/mame/mame.mame.keys $(TARGET_DIR)/usr/share/evmapy/dataeast.mame.keys
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/mame/mame.mame.keys $(TARGET_DIR)/usr/share/evmapy/dynax.mame.keys
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/mame/mame.mame.keys $(TARGET_DIR)/usr/share/evmapy/eighting.mame.keys
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/mame/mame.mame.keys $(TARGET_DIR)/usr/share/evmapy/exidy.mame.keys
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/mame/mame.mame.keys $(TARGET_DIR)/usr/share/evmapy/gaelco.mame.keys
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/mame/mame.mame.keys $(TARGET_DIR)/usr/share/evmapy/gottlieb.mame.keys
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/mame/mame.mame.keys $(TARGET_DIR)/usr/share/evmapy/igs.mame.keys
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/mame/mame.mame.keys $(TARGET_DIR)/usr/share/evmapy/incredibletech.mame.keys
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/mame/mame.mame.keys $(TARGET_DIR)/usr/share/evmapy/irem.mame.keys
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/mame/mame.mame.keys $(TARGET_DIR)/usr/share/evmapy/jaleco.mame.keys
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/mame/mame.mame.keys $(TARGET_DIR)/usr/share/evmapy/kaneko.mame.keys
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/mame/mame.mame.keys $(TARGET_DIR)/usr/share/evmapy/konami.mame.keys
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/mame/mame.mame.keys $(TARGET_DIR)/usr/share/evmapy/midway.mame.keys
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/mame/mame.mame.keys $(TARGET_DIR)/usr/share/evmapy/mitchell.mame.keys
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/mame/mame.mame.keys $(TARGET_DIR)/usr/share/evmapy/namco.mame.keys
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/mame/mame.mame.keys $(TARGET_DIR)/usr/share/evmapy/nichibutsu.mame.keys
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/mame/mame.mame.keys $(TARGET_DIR)/usr/share/evmapy/nintendo.mame.keys
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/mame/mame.mame.keys $(TARGET_DIR)/usr/share/evmapy/nmk.mame.keys
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/mame/mame.mame.keys $(TARGET_DIR)/usr/share/evmapy/pgm.mame.keys
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/mame/mame.mame.keys $(TARGET_DIR)/usr/share/evmapy/playchoice.mame.keys
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/mame/mame.mame.keys $(TARGET_DIR)/usr/share/evmapy/psikyo.mame.keys
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/mame/mame.mame.keys $(TARGET_DIR)/usr/share/evmapy/sammy.mame.keys
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/mame/mame.mame.keys $(TARGET_DIR)/usr/share/evmapy/sega.mame.keys
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/mame/mame.mame.keys $(TARGET_DIR)/usr/share/evmapy/segastv.mame.keys
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/mame/mame.mame.keys $(TARGET_DIR)/usr/share/evmapy/seibu.mame.keys
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/mame/mame.mame.keys $(TARGET_DIR)/usr/share/evmapy/semicom.mame.keys
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/mame/mame.mame.keys $(TARGET_DIR)/usr/share/evmapy/seta.mame.keys
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/mame/mame.mame.keys $(TARGET_DIR)/usr/share/evmapy/snk.mame.keys
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/mame/mame.mame.keys $(TARGET_DIR)/usr/share/evmapy/taito.mame.keys
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/mame/mame.mame.keys $(TARGET_DIR)/usr/share/evmapy/technos.mame.keys
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/mame/mame.mame.keys $(TARGET_DIR)/usr/share/evmapy/tecmo.mame.keys
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/mame/mame.mame.keys $(TARGET_DIR)/usr/share/evmapy/toaplan.mame.keys
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/mame/mame.mame.keys $(TARGET_DIR)/usr/share/evmapy/unico.mame.keys
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/mame/mame.mame.keys $(TARGET_DIR)/usr/share/evmapy/universal.mame.keys
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/mame/mame.mame.keys $(TARGET_DIR)/usr/share/evmapy/visco.mame.keys

endef

MAME_POST_INSTALL_TARGET_HOOKS += MAME_EVMAPY

$(eval $(generic-package))
