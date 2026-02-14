################################################################################
#
# libretro-mame-src
#
################################################################################
# Version: Commits on Feb 14, 2026
LIBRETRO_MAME_SRC_VERSION = 28ce5f50ef44080c28e708677341b80d2e0dcd61
LIBRETRO_MAME_SRC_SITE = $(call github,hancock33,lr-mame,$(LIBRETRO_MAME_SRC_VERSION))
LIBRETRO_MAME_SRC_DEPENDENCIES = host-python3 alsa-lib fontconfig sdl2 sdl2_ttf zlib
LIBRETRO_MAME_SRC_LICENSE = MAME

ifeq ($(BR2_x86_64),y)
    LIBRETRO_MAME_SRC_EXTRA_ARGS += LIBRETRO_CPU=x86_64
else ifeq ($(BR2_aarch64),y)
    LIBRETRO_MAME_SRC_EXTRA_ARGS += LIBRETRO_CPU=arm64
endif

# Limit number of jobs not to eat too much RAM....
LIBRETRO_MAME_SRC_JOBS = $(shell expr $(shell nproc))

define LIBRETRO_MAME_SRC_BUILD_CMDS
	# First, we need to build genie for host
	cd $(@D); \
		PATH="$(HOST_DIR)/bin:$$PATH" \
		$(MAKE) TARGETOS=linux OSD=sdl genie \
		TARGET=mame SUBTARGET=tiny \
		NO_USE_PORTAUDIO=1 NO_X11=1 USE_SDL=0 \
		USE_QTDEBUG=0 DEBUG=0 IGNORE_GIT=1 MPARAM=""

	# Compile emulation target (MAME)
	CCACHE_SLOPPINESS="pch_defines,time_macros,include_file_ctime,include_file_mtime" \
	CFLAGS="--sysroot=$(STAGING_DIR) -pipe -w" \
	CXXFLAGS="--sysroot=$(STAGING_DIR) -pipe -w" \
	LDFLAGS="--sysroot=$(STAGING_DIR)" \
	PATH="$(HOST_DIR)/bin:$$PATH" \
	PKG_CONFIG_PATH="$(STAGING_DIR)/usr/lib/pkgconfig" \
	PKG_CONFIG="$(HOST_DIR)/bin/pkg-config --define-prefix" \
	SYSROOT="$(STAGING_DIR)" \
		$(MAKE) -j$(LIBRETRO_MAME_SRC_JOBS) -C $(@D)/ -f Makefile.libretro \
		$(LIBRETRO_MAME_SRC_EXTRA_ARGS) \
		ARCHOPTS=-fuse-ld=mold \
		OPENMP=0 \
		AR="$(HOST_DIR)/bin/llvm-ar" \
		CC="$(HOST_DIR)/bin/ccache $(HOST_DIR)/bin/clang" \
		CXX="$(HOST_DIR)/bin/ccache $(HOST_DIR)/bin/clang++" \
		LD="$(TARGET_LD)" \
		PRECOMPILE=1 \
		OPTIMIZE=3 LTO=1 OPT_FLAGS=$(BR2_TARGET_OPTIMIZATION)
endef

define LIBRETRO_MAME_SRC_INSTALL_TARGET_CMDS
	rm -rf /tmp/lr-mame
	mkdir -p /tmp/lr-mame/usr/lib/libretro
	mkdir -p /tmp/lr-mame/usr/bin/mame
	$(INSTALL) -D $(@D)/mame_libretro.so /tmp/lr-mame/usr/lib/libretro/mame_libretro.so
	$(HOST_DIR)/bin/llvm-strip /tmp/lr-mame/usr/lib/libretro/mame_libretro.so
	cp -R $(@D)/hash /tmp/lr-mame/usr/bin/mame/

	cd /tmp/lr-mame && tar -cf /tmp/libretro-mame-$(MAME_SRC_CROSS_ARCH)-$(subst mame,,$(MAME_SRC_VERSION)).tar .
	xz -T0 -7 -v /tmp/libretro-mame-$(MAME_SRC_CROSS_ARCH)-$(subst mame,,$(MAME_SRC_VERSION)).tar
	mv /tmp/libretro-mame-$(MAME_SRC_CROSS_ARCH)-$(subst mame,,$(MAME_SRC_VERSION)).tar.xz /mnt/smb
	rm -rf /tmp/lr-mame*
endef

$(eval $(generic-package))
