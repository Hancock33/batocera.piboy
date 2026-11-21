################################################################################
#
# libretro-mame-src
#
################################################################################
# Version: Commits on Nov 20, 2026
LIBRETRO_MAME_SRC_VERSION = 4520e5a413a7d31a2899dfe4c740b5de2f80ee73
LIBRETRO_MAME_SRC_SITE = $(call github,hancock33,lr-mame,$(LIBRETRO_MAME_SRC_VERSION))
LIBRETRO_MAME_SRC_DEPENDENCIES = host-python3 alsa-lib fontconfig sdl2 sdl2_ttf zlib
LIBRETRO_MAME_SRC_LICENSE = MAME

ifeq ($(BR2_x86_64),y)
    LIBRETRO_MAME_SRC_EXTRA_ARGS += LIBRETRO_CPU=x86_64
else ifeq ($(BR2_aarch64),y)
    LIBRETRO_MAME_SRC_EXTRA_ARGS += LIBRETRO_CPU=arm64
endif

# Follow BR2_JLEVEL (nproc + 1 when unset)
LIBRETRO_MAME_SRC_JOBS = $(PARALLEL_JOBS)

# Named after the MAME release this core tracks (see mame-src.mk).
LIBRETRO_MAME_SRC_DIST_DIR = $(@D)/batocera-dist
LIBRETRO_MAME_SRC_TARBALL = libretro-mame-$(MAME_SRC_CROSS_ARCH)-$(subst mame,,$(MAME_SRC_VERSION)).tar.xz

define LIBRETRO_MAME_SRC_BUILD_CMDS
	# First, we need to build genie for host
	cd $(@D); \
		PATH="$(HOST_DIR)/bin:$$PATH" \
		$(MAKE) -j$(LIBRETRO_MAME_SRC_JOBS) TARGETOS=linux OSD=sdl genie \
		TARGET=mame SUBTARGET=tiny \
		NO_USE_PORTAUDIO=1 NO_X11=1 USE_SDL=0 \
		USE_QTDEBUG=0 DEBUG=0 IGNORE_GIT=1 MPARAM=""

	# Compile emulation target (MAME)
	CCACHE_SLOPPINESS="pch_defines,time_macros,include_file_ctime,include_file_mtime" \
	CFLAGS="--sysroot=$(STAGING_DIR) -pipe -w" \
	CXXFLAGS="--sysroot=$(STAGING_DIR) -pipe -w" \
	LDFLAGS="$(TARGET_LDFLAGS) --sysroot=$(STAGING_DIR)" \
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
		OPTIMIZE=2 LTO=1 OPT_FLAGS=$(BR2_TARGET_OPTIMIZATION)
endef

define LIBRETRO_MAME_SRC_INSTALL_TARGET_CMDS
	rm -rf $(LIBRETRO_MAME_SRC_DIST_DIR)
	mkdir -p $(LIBRETRO_MAME_SRC_DIST_DIR)/usr/lib/libretro
	mkdir -p $(LIBRETRO_MAME_SRC_DIST_DIR)/usr/bin/mame
	$(INSTALL) -D $(@D)/mame_libretro.so $(LIBRETRO_MAME_SRC_DIST_DIR)/usr/lib/libretro/mame_libretro.so
	$(HOST_DIR)/bin/llvm-strip $(LIBRETRO_MAME_SRC_DIST_DIR)/usr/lib/libretro/mame_libretro.so
	cp -R $(@D)/hash $(LIBRETRO_MAME_SRC_DIST_DIR)/usr/bin/mame/

	# Pack (root-owned, streamed straight into xz) and publish
	tar -C $(LIBRETRO_MAME_SRC_DIST_DIR) --owner=0 --group=0 --numeric-owner -cf - . | \
		xz -T0 -7 -v > $(@D)/$(LIBRETRO_MAME_SRC_TARBALL)
	mv $(@D)/$(LIBRETRO_MAME_SRC_TARBALL) /mnt/smb/
	rm -rf $(LIBRETRO_MAME_SRC_DIST_DIR)
endef

$(eval $(generic-package))
