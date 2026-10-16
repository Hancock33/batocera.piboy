################################################################################
#
# libretro-scummvm
#
################################################################################
# Version: Commits on Oct 10, 2026
LIBRETRO_SCUMMVM_VERSION = v2026.4.0
LIBRETRO_SCUMMVM_SOURCE = scummvm-$(LIBRETRO_SCUMMVM_VERSION).tar.gz
LIBRETRO_SCUMMVM_SITE = $(call github,scummvm,scummvm,$(LIBRETRO_SCUMMVM_VERSION))
LIBRETRO_SCUMMVM_LICENSE = GPLv2
LIBRETRO_SCUMMVM_DEPENDENCIES = faad2 flac freetype jpeg libmad libmpeg2 libogg libpng libtheora libvorbis
LIBRETRO_SCUMMVM_DEPENDENCIES += retroarch sdl2 zlib
LIBRETRO_SCUMMVM_EMULATOR_INFO = scummvm.libretro.core.yml

LIBRETRO_SCUMMVM_PLATFORM = $(LIBRETRO_PLATFORM)

ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_BCM2836),y)
    LIBRETRO_SCUMMVM_PLATFORM = rpi2
else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_BCM2837),y)
    LIBRETRO_SCUMMVM_PLATFORM = rpi3_64
else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_BCM2711),y)
    LIBRETRO_SCUMMVM_PLATFORM = rpi4_64
else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_BCM2712),y)
    LIBRETRO_SCUMMVM_PLATFORM = rpi5_64
else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_S812),y)
    LIBRETRO_SCUMMVM_PLATFORM = armv cortexa9 neon hardfloat
else ifeq ($(BR2_aarch64),y)
    LIBRETRO_SCUMMVM_PLATFORM = unix
    LIBRETRO_SCUMMVM_MAKE_OPTS += TARGET_64BIT=1
else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_X86_64_ANY),y)
    LIBRETRO_SCUMMVM_PLATFORM = unix
    LIBRETRO_SCUMMVM_MAKE_OPTS += TARGET_64BIT=1
else
    LIBRETRO_SCUMMVM_PLATFORM = $(LIBRETRO_PLATFORM)
endif

# match the retroarch GL flavour, a desktop GL context request fails on GLES builds
ifneq ($(BR2_x86_64),y)
    ifeq ($(BR2_PACKAGE_BATOCERA_GLES3)$(BR2_PACKAGE_BATOCERA_GLES2),y)
        LIBRETRO_SCUMMVM_MAKE_OPTS += FORCE_OPENGLES2=1
    endif
endif

define LIBRETRO_SCUMMVM_CLONE_AND_INIT
	mkdir -p $(@D)/backends/platform/libretro/deps/$(1)
	git -C $(@D)/backends/platform/libretro/deps/$(1) init
	git -C $(@D)/backends/platform/libretro/deps/$(1) remote add origin https://github.com/libretro/$(1)
	git -C $(@D)/backends/platform/libretro/deps/$(1) fetch --depth 1 origin $(2)
	git -C $(@D)/backends/platform/libretro/deps/$(1) checkout FETCH_HEAD
	git -C $(@D)/backends/platform/libretro/deps/$(1) submodule update --init --recursive --depth 1
endef

# Details from backends/platform/libretro/dependencies.mk
define LIBRETRO_SCUMMVM_GIT_DL
	$(call LIBRETRO_SCUMMVM_CLONE_AND_INIT,libretro-deps,bab7d258c451c0e7cba4b6a79f1b062c13efff38)
	$(call LIBRETRO_SCUMMVM_CLONE_AND_INIT,libretro-common,879c8d507b0b52e77e27d759239c2b5df1e26dfd)
endef

define LIBRETRO_SCUMMVM_BUILD_CMDS
	$(SED) "s|\-O[23]|$(TARGET_OPTIMIZATION)|g" $(@D)/backends/platform/libretro/Makefile
	$(TARGET_CONFIGURE_OPTS) $(MAKE) CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" -C $(@D)/backends/platform/libretro \
	platform="$(LIBRETRO_SCUMMVM_PLATFORM)" $(LIBRETRO_SCUMMVM_MAKE_OPTS) all
endef

define LIBRETRO_SCUMMVM_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/lib/libretro
	mkdir -p $(TARGET_DIR)/usr/share/libretro/info
	$(INSTALL) -D $(@D)/backends/platform/libretro/scummvm_libretro.so   $(TARGET_DIR)/usr/lib/libretro/scummvm_libretro.so
	$(INSTALL) -D $(@D)/backends/platform/libretro/scummvm_libretro.info $(TARGET_DIR)/usr/share/libretro/info/scummvm_libretro.info
endef

LIBRETRO_SCUMMVM_POST_EXTRACT_HOOKS = LIBRETRO_SCUMMVM_GIT_DL

$(eval $(generic-package))
$(eval $(emulator-info-package))
