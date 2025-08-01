################################################################################
#
# libretro-dosbox-pure
#
################################################################################
# Version: Commits on Aug 01, 2025
LIBRETRO_DOSBOX_PURE_VERSION = 3cfa3e3d167e1cc7a1a06485f0606d5fd10a1000
LIBRETRO_DOSBOX_PURE_SITE = $(call github,schellingb,dosbox-pure,$(LIBRETRO_DOSBOX_PURE_VERSION))
LIBRETRO_DOSBOX_PURE_LICENSE = GPLv2
LIBRETRO_DOSBOX_PURE_DEPENDENCIES = retroarch

ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_BCM2835),y)
    LIBRETRO_DOSBOX_PURE_PLATFORM = rpi1
else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_BCM2836),y)
    LIBRETRO_DOSBOX_PURE_PLATFORM = rpi2
else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_BCM2837),y)
    LIBRETRO_DOSBOX_PURE_PLATFORM = rpi3_64
else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_BCM2711),y)
    LIBRETRO_DOSBOX_PURE_PLATFORM = rpi4
else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_BCM2712),y)
    LIBRETRO_DOSBOX_PURE_PLATFORM = rpi5
else
    LIBRETRO_DOSBOX_PURE_PLATFORM=$(BATOCERA_SYSTEM)
endif

# x86
ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_X86),y)
LIBRETRO_DOSBOX_PURE_EXTRA_ARGS = target=x86 WITH_FAKE_SDL=1
# x86_64
else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_X86_64_ANY),y)
LIBRETRO_DOSBOX_PURE_EXTRA_ARGS = target=x86_64 WITH_FAKE_SDL=1
else ifeq ($(BR2_arm),y)
LIBRETRO_DOSBOX_PURE_EXTRA_ARGS = target=arm WITH_FAKE_SDL=1
else ifeq ($(BR2_aarch64),y)
LIBRETRO_DOSBOX_PURE_EXTRA_ARGS = target=arm64 WITH_FAKE_SDL=1
endif

define LIBRETRO_DOSBOX_PURE_BUILD_CMDS
	$(SED) "s|\-O[23]|$(TARGET_OPTIMIZATION)|g" $(@D)/Makefile
	$(TARGET_CONFIGURE_OPTS) $(MAKE) CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" cross_prefix="$(STAGING_DIR)/usr/bin/" -C $(@D) -f Makefile \
		platform=$(LIBRETRO_DOSBOX_PURE_PLATFORM) $(LIBRETRO_DOSBOX_PURE_EXTRA_ARGS)
endef

define LIBRETRO_DOSBOX_PURE_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/lib/libretro
	$(INSTALL) -D $(@D)/dosbox_pure_libretro.so $(TARGET_DIR)/usr/lib/libretro/dosbox_pure_libretro.so
endef

$(eval $(generic-package))
