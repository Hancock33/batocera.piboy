################################################################################
#
# libretro-mame-src
#
################################################################################
# Version: Commits on Apr 29, 2025
LIBRETRO_MAME_SRC_VERSION = 0189a563218ddb52c8f857ef6a21587988684484
LIBRETRO_MAME_SRC_SITE = $(call github,Hancock33,lr-mame,$(LIBRETRO_MAME_SRC_VERSION))
LIBRETRO_MAME_SRC_DEPENDENCIES = sdl2 sdl2_ttf zlib libpng fontconfig sqlite jpeg flac rapidjson expat glm pulseaudio
LIBRETRO_MAME_SRC_LICENSE = MAME

# Limit number of jobs not to eat too much RAM....
LIBRETRO_MAME_SRC_JOBS = $(shell expr $(shell nproc))

ifeq ($(BR2_x86_64),y)
    LIBRETRO_MAME_SRC_EXTRA_ARGS += PTR64=1 LIBRETRO_CPU=x86_64 PLATFORM=x86_64
else ifeq ($(BR2_aarch64),y)
    LIBRETRO_MAME_SRC_EXTRA_ARGS += PTR64=1 LIBRETRO_CPU=aarch64 PLATFORM=aarch64
    # workaround for asmjit broken build system (arm backend is not public)
    LIBRETRO_MAME_SRC_ARCHOPTS += -D__aarch64__ -DASMJIT_BUILD_X86
endif

define LIBRETRO_MAME_SRC_BUILD_CMDS
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
	CCACHE_SLOPPINESS="pch_defines,time_macros,include_file_ctime,include_file_mtime" \
	$(MAKE) -j$(LIBRETRO_MAME_SRC_JOBS) -C $(@D)/ \
	$(LIBRETRO_MAME_SRC_EXTRA_ARGS) \
	AR="$(TARGET_AR)" \
	ARCH="" \
	ARCHOPTS="$(LIBRETRO_MAME_SRC_ARCHOPTS) -fuse-ld=mold" \
	CFLAGS="$(LIBRETRO_MAME_SRC_CFLAGS)" \
	CONFIG=libretro \
	CROSS_BUILD=1 \
	DEBUG=0 \
	DISTRO="debian-stable" \
	FORCE_DRC_C_BACKEND=0 \
	LDFLAGS="$(LIBRETRO_MAME_SRC_LDFLAGS)" \
	LDOPTS="-lasound -lfontconfig" \
	LIBRETRO_OS="unix" \
	NOWERROR=1 \
	OPENMP=1 \
	OSD="retro" \
	OVERRIDE_AR="$(TARGET_AR)" \
	OVERRIDE_CC="$(TARGET_CC)" \
	OVERRIDE_CXX="$(TARGET_CXX)" \
	OVERRIDE_LD="$(TARGET_LD)" \
	OVERRIDE_STRIP="$(TARGET_STRIP)" \
	PROJECT="" \
	PYTHON_EXECUTABLE=python3 \
	RANLIB="$(TARGET_RANLIB)" \
	REGENIE=1 \
	RETRO=1 \
	SUBTARGET="mame" \
	SYMBOLS=0 \
	TARGET="mame" \
	USE_SYSTEM_LIB_EXPAT=1 \
	USE_SYSTEM_LIB_FLAC=1 \
	USE_SYSTEM_LIB_GLM=1 \
	USE_SYSTEM_LIB_JPEG=1 \
	USE_SYSTEM_LIB_RAPIDJSON=1 \
	USE_SYSTEM_LIB_SQLITE3=1 \
	USE_SYSTEM_LIB_ZLIB=1 \
	VERBOSE=1 \
	OPTIMIZE=s OPT_FLAGS=$(BR2_TARGET_OPTIMIZATION)
endef

define LIBRETRO_MAME_SRC_INSTALL_TARGET_CMDS
	mkdir -p /tmp/lr-mame/usr/lib/libretro
	$(INSTALL) -D $(@D)/mame_libretro.so /tmp/lr-mame/usr/lib/libretro/mame_libretro.so

	cd /tmp/lr-mame && tar -cf /tmp/libretro-mame-$(MAME_SRC_CROSS_ARCH)-$(subst mame,,$(MAME_SRC_VERSION)).tar .
	xz -T0 -7 -v /tmp/libretro-mame-$(MAME_SRC_CROSS_ARCH)-$(subst mame,,$(MAME_SRC_VERSION)).tar
	mv /tmp/libretro-mame-$(MAME_SRC_CROSS_ARCH)-$(subst mame,,$(MAME_SRC_VERSION)).tar.xz /mnt/smb
	rm -rf /tmp/lr-mame*
endef

$(eval $(generic-package))
