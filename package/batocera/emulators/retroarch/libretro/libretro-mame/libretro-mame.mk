################################################################################
#
# libretro-mame
#
################################################################################
# Version: Commits on Aug 31, 2024
LIBRETRO_MAME_VERSION = 8b9b8f5f5b47161327d93522318c81fba2087b2f
LIBRETRO_MAME_SITE = $(call github,sonninnos,mame,$(LIBRETRO_MAME_VERSION))
LIBRETRO_MAME_LICENSE = MAME

LIBRETRO_MAME_DEPENDENCIES = alsa-lib

# Limit number of jobs not to eat too much RAM....
LIBRETRO_MAME_JOBS = $(shell expr $(shell nproc))

ifeq ($(BR2_x86_64),y)
    LIBRETRO_MAME_EXTRA_ARGS += PTR64=1 LIBRETRO_CPU=x86_64 PLATFORM=x86_64
else ifeq ($(BR2_i386),y)
    LIBRETRO_MAME_EXTRA_ARGS += PTR64=0 LIBRETRO_CPU=x86 PLATFORM=x86
else ifeq ($(BR2_RISCV_64),y)
    LIBRETRO_MAME_EXTRA_ARGS += PTR64=1 LIBRETRO_CPU=riscv64 PLATFORM=riscv64
else ifeq ($(BR2_riscv),y)
    LIBRETRO_MAME_EXTRA_ARGS += PTR64=0 LIBRETRO_CPU=riscv PLATFORM=riscv
else ifeq ($(BR2_arm),y)
    LIBRETRO_MAME_EXTRA_ARGS += PTR64=0 LIBRETRO_CPU=arm PLATFORM=arm
    # workaround for linkage failure using ld on arm 32-bit targets
    LIBRETRO_MAME_ARCHOPTS += -fuse-ld=gold -Wl,--long-plt
    # workaround for asmjit broken build system (arm backend is not public)
    LIBRETRO_MAME_ARCHOPTS += -D__arm__ -DASMJIT_BUILD_X86
else ifeq ($(BR2_aarch64),y)
    LIBRETRO_MAME_EXTRA_ARGS += PTR64=1 LIBRETRO_CPU= PLATFORM=arm64
    # workaround for asmjit broken build system (arm backend is not public)
    LIBRETRO_MAME_ARCHOPTS += -D__aarch64__ -DASMJIT_BUILD_X86
endif

ifeq ($(BR2_ENABLE_DEBUG),y)
    LIBRETRO_MAME_EXTRA_ARGS += SYMBOLS=1 SYMLEVEL=2 OPTIMIZE=0
endif

LIBRETRO_MAME_CFLAGS = $(TARGET_OPTIMIZATION)
LIBRETRO_MAME_LDFLAGS = -fuse-ld=mold

define LIBRETRO_MAME_BUILD_CMDS
	# create some dirs while with parallelism, sometimes it fails because this directory is missing
	mkdir -p $(@D)/build/libretro/obj/x64/libretro/src/osd/libretro/libretro-internal

	# First, we need to build genie for host
	cd $(@D); \
	PATH="$(HOST_DIR)/bin:$$PATH" \
	$(MAKE) TARGETOS=linux OSD=sdl genie \
	TARGET=mame SUBTARGET=tiny \
	NO_USE_PORTAUDIO=1 NO_X11=1 USE_SDL=0 \
	USE_QTDEBUG=0 DEBUG=0 IGNORE_GIT=1 MPARAM=""

	# Compile emulation target (MAME)
	$(MAKE) -j$(LIBRETRO_MAME_JOBS) -C $(@D)/ OPENMP=1 REGENIE=1 VERBOSE=1 NOWERROR=1 PYTHON_EXECUTABLE=python3 \
		CFLAGS="$(LIBRETRO_MAME_CFLAGS)" LDFLAGS="$(LIBRETRO_MAME_LDFLAGS)" \
		CONFIG=libretro LIBRETRO_OS="unix" ARCH="" PROJECT="" ARCHOPTS="$(LIBRETRO_MAME_ARCHOPTS)" \
		DISTRO="debian-stable" OVERRIDE_CC="$(TARGET_CC)" OVERRIDE_CXX="$(TARGET_CXX)" \
		OVERRIDE_LD="$(TARGET_LD)" RANLIB="$(TARGET_RANLIB)" AR="$(TARGET_AR)" \
		$(LIBRETRO_MAME_EXTRA_ARGS) CROSS_BUILD=1 TARGET="mame" SUBTARGET="mame" RETRO=1 \
		OSD="retro" DEBUG=0 PRECOMPILE=0 OPTIMIZE=s
endef

define LIBRETRO_MAME_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/lib/libretro

	$(INSTALL) -D $(@D)/mame_libretro.so $(TARGET_DIR)/usr/lib/libretro/mame_libretro.so

	mkdir -p $(TARGET_DIR)/usr/share/lr-mame
	ln -sf /usr/bin/mame/hash $(TARGET_DIR)/usr/share/lr-mame/hash

	mkdir -p $(TARGET_DIR)/usr/share/mame
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/mame/blank.fmtowns $(TARGET_DIR)/usr/share/mame/blank.fmtowns

	# Copy coin drop plugin
	mkdir -p $(TARGET_DIR)/usr/bin/mame/
	cp -R -u $(@D)/plugins $(TARGET_DIR)/usr/bin/mame/
	cp -R -u $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/mame/coindrop $(TARGET_DIR)/usr/bin/mame/plugins
endef

define LIBRETRO_MAME_EVMAPY
	mkdir -p $(TARGET_DIR)/usr/share/evmapy
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/retroarch/libretro/libretro-mame/mame.keys \
	    $(TARGET_DIR)/usr/share/evmapy
endef

LIBRETRO_MAME_POST_INSTALL_TARGET_HOOKS += LIBRETRO_MAME_EVMAPY

$(eval $(generic-package))
