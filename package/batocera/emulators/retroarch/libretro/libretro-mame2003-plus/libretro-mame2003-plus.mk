################################################################################
#
# libretro-mame2003-plus
#
################################################################################
# Version: Commits on Nov 12, 2025
LIBRETRO_MAME2003_PLUS_VERSION = dbd33ad168476a4504e289f84bcd774543eec840
LIBRETRO_MAME2003_PLUS_SITE = $(call github,libretro,mame2003-plus-libretro,$(LIBRETRO_MAME2003_PLUS_VERSION))
LIBRETRO_MAME2003_PLUS_LICENSE = MAME
LIBRETRO_MAME2003_PLUS_DEPENDENCIES = retroarch

ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_BCM2835),y)
    LIBRETRO_MAME2003_PLUS_PLATFORM = rpi1
else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_BCM2836),y)
    LIBRETRO_MAME2003_PLUS_PLATFORM = rpi2
else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_BCM2837),y)
    LIBRETRO_MAME2003_PLUS_PLATFORM = rpi3_64
else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_BCM2711),y)
    LIBRETRO_MAME2003_PLUS_PLATFORM = rpi4_64
else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_BCM2712),y)
    LIBRETRO_MAME2003_PLUS_PLATFORM = rpi5_64
else ifeq ($(BR2_aarch64),y)
    LIBRETRO_MAME2003_PLUS_PLATFORM = unix
else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_S812),y)
    LIBRETRO_MAME2003_PLUS_PLATFORM = s812
    LIBRETRO_MAME2003_PLUS_EXTRA_ARGS = HAS_CYCLONE=1 HAS_DRZ80=1
else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_H3)$(BR2_PACKAGE_BATOCERA_TARGET_RK3128),y)
    LIBRETRO_MAME2003_PLUS_PLATFORM = rpi2
    LIBRETRO_MAME2003_PLUS_EXTRA_ARGS = HAS_CYCLONE=1 HAS_DRZ80=1
else
    LIBRETRO_MAME2003_PLUS_PLATFORM = $(LIBRETRO_PLATFORM)
endif

define LIBRETRO_MAME2003_PLUS_BUILD_CMDS
	$(SED) "s|-ffast-math|$(TARGET_OPTIMIZATION)|g" $(@D)/Makefile

	mkdir -p $(@D)/obj/mame/cpu/ccpu
	$(TARGET_CONFIGURE_OPTS) $(MAKE) CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" -C $(@D)/ -f Makefile platform="$(LIBRETRO_MAME2003_PLUS_PLATFORM)" \
		OPTIMIZE=s SYMBOLS=1 SYMLEVEL=1 STRIP_SYMBOLS=1 $(LIBRETRO_MAME2003_PLUS_EXTRA_ARGS) \
		GIT_VERSION=" $(shell echo $(LIBRETRO_MAME2003_PLUS_VERSION) | cut -c 1-7)"
endef

define LIBRETRO_MAME2003_PLUS_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/lib/libretro
	$(INSTALL) -D $(@D)/mame2003_plus_libretro.so $(TARGET_DIR)/usr/lib/libretro/mame078plus_libretro.so

	# Bios
	# Need to think of another way to use these files.
	# They take up a lot of space on tmpfs.
	mkdir -p $(TARGET_DIR)/usr/share/batocera/datainit/bios/mame2003-plus/samples
	find $(@D)/metadata -maxdepth 1 -iname "*.xml" -print0 | xargs -0 -I{} xz -9 {}
	find $(@D)/metadata -maxdepth 1 -iname "*.xml" -print0 | xargs -0 -I{} rm {}
	cp -r $(@D)/metadata/* $(TARGET_DIR)/usr/share/batocera/datainit/bios/mame2003-plus
endef

define LIBRETRO_MAME2003_PLUS_NAMCO_QUICK_FIX
	$(SED) 's|to continue|on Keyboard, or Left, Right on Joystick to continue|g' $(@D)/src/ui_text.c
endef

LIBRETRO_MAME2003_PLUS_PRE_BUILD_HOOKS += LIBRETRO_MAME2003_PLUS_NAMCO_QUICK_FIX

$(eval $(generic-package))
