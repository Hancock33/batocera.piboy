################################################################################
#
# libretro-mame-src
#
################################################################################
# Version: Commits on Jul 12, 2025
LIBRETRO_MAME_SRC_VERSION = d6423328d57857c05ef3513999fe4ff4917db197
LIBRETRO_MAME_SRC_SITE = $(call github,libretro,mame,$(LIBRETRO_MAME_SRC_VERSION))
LIBRETRO_MAME_SRC_DEPENDENCIES = sdl2 sdl2_ttf zlib libpng fontconfig sqlite jpeg flac rapidjson expat glm pulseaudio
LIBRETRO_MAME_SRC_LICENSE = MAME

ifeq ($(BR2_x86_64),y)
    LIBRETRO_MAME_SRC_EXTRA_ARGS += LIBRETRO_CPU=x86_64 PLATFORM=x86_64
else ifeq ($(BR2_aarch64),y)
    LIBRETRO_MAME_SRC_EXTRA_ARGS += LIBRETRO_CPU=aarch64 PLATFORM=aarch64 ARCHITECTURE=
endif

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
	$(TARGET_CONFIGURE_OPTS) $(MAKE) CXX="$(HOST_DIR)/bin/ccache $(TARGET_CXX)" CC="$(HOST_DIR)/bin/ccache $(TARGET_CC)" -C $(@D)/ -f Makefile.libretro \
		$(LIBRETRO_MAME_SRC_EXTRA_ARGS) \
		FORCE_DRC_C_BACKEND=0 \
		OPTIMIZE=s LTO=1 OPT_FLAGS=$(BR2_TARGET_OPTIMIZATION)
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
