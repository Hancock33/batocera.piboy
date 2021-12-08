################################################################################
#
# MAME2003 PLUS
#
################################################################################
# Version.: Commits on Dec 08, 2021
LIBRETRO_MAME2003_PLUS_VERSION = 99432c71bbba49ad9d87702d53d814da42fde1f4
LIBRETRO_MAME2003_PLUS_SITE = $(call github,libretro,mame2003-plus-libretro,$(LIBRETRO_MAME2003_PLUS_VERSION))
LIBRETRO_MAME2003_PLUS_LICENSE = MAME

LIBRETRO_MAME2003_PLUS_PLATFORM = $(LIBRETRO_PLATFORM)

ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_RPI1),y)
LIBRETRO_MAME2003_PLUS_PLATFORM = rpi1

else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_RPI2),y)
LIBRETRO_MAME2003_PLUS_PLATFORM = rpi2

else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_RPI3)$(BR2_PACKAGE_BATOCERA_TARGET_RPIZERO2),y)
    ifeq ($(BR2_arm),y)
        LIBRETRO_MAME2003_PLUS_PLATFORM = rpi3
    else
        LIBRETRO_MAME2003_PLUS_PLATFORM = rpi3_64
    endif

else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_RPI4),y)
LIBRETRO_MAME2003_PLUS_PLATFORM = rpi4_64

else ifeq ($(BR2_aarch64),y)
LIBRETRO_MAME2003_PLUS_PLATFORM = unix

else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_S812),y)
LIBRETRO_MAME2003_PLUS_PLATFORM = s812
LIBRETRO_MAME2003_PLUS_EXTRA_ARGS = HAS_CYCLONE=1 HAS_DRZ80=1

else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_ORANGEPI_PC)$(BR2_PACKAGE_BATOCERA_TARGET_CHA),y)
LIBRETRO_MAME2003_PLUS_PLATFORM = rpi2
LIBRETRO_MAME2003_PLUS_EXTRA_ARGS = HAS_CYCLONE=1 HAS_DRZ80=1
endif

define LIBRETRO_MAME2003_PLUS_BUILD_CMDS
	mkdir -p $(@D)/obj/mame/cpu/ccpu
	$(TARGET_CONFIGURE_OPTS) $(MAKE) CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" -C $(@D)/ -f Makefile platform="$(LIBRETRO_MAME2003_PLUS_PLATFORM)" \
        GIT_VERSION=" $(shell echo $(LIBRETRO_MAME2003_PLUS_VERSION) | cut -c 1-7)"
endef

define LIBRETRO_MAME2003_PLUS_INSTALL_TARGET_CMDS
	$(INSTALL) -D $(@D)/mame2003_plus_libretro.so \
		$(TARGET_DIR)/usr/lib/libretro/mame078plus_libretro.so

	# Bios
    # Need to think of another way to use these files.
    # They take up a lot of space on tmpfs.
		mkdir -p $(TARGET_DIR)/usr/share/batocera/datainit/bios/mame2003-plus/samples
	cp -r $(@D)/metadata/* \
		$(TARGET_DIR)/usr/share/batocera/datainit/bios/mame2003-plus
		mkdir -p $(TARGET_DIR)/usr/share/batocera/datainit/system/configs/emulationstation
	cp -avr $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/retroarch/libretro/libretro-mame2003-plus/es_systems_arcade.cfg $(TARGET_DIR)/usr/share/batocera/datainit/system/configs/emulationstation
		mkdir -p $(TARGET_DIR)/usr/share/batocera/datainit/roms/arcade/acclaim
		mkdir -p $(TARGET_DIR)/usr/share/batocera/datainit/roms/arcade/alg
		mkdir -p $(TARGET_DIR)/usr/share/batocera/datainit/roms/arcade/alphadenshi
		mkdir -p $(TARGET_DIR)/usr/share/batocera/datainit/roms/arcade/amcoe
		mkdir -p $(TARGET_DIR)/usr/share/batocera/datainit/roms/arcade/atari
		mkdir -p $(TARGET_DIR)/usr/share/batocera/datainit/roms/arcade/atlus
		mkdir -p $(TARGET_DIR)/usr/share/batocera/datainit/roms/arcade/banpresto
		mkdir -p $(TARGET_DIR)/usr/share/batocera/datainit/roms/arcade/cave
		mkdir -p $(TARGET_DIR)/usr/share/batocera/datainit/roms/arcade/centurye
		mkdir -p $(TARGET_DIR)/usr/share/batocera/datainit/roms/arcade/cinematronics
		mkdir -p $(TARGET_DIR)/usr/share/batocera/datainit/roms/arcade/comad
		mkdir -p $(TARGET_DIR)/usr/share/batocera/datainit/roms/arcade/cps1
		mkdir -p $(TARGET_DIR)/usr/share/batocera/datainit/roms/arcade/cps2
		mkdir -p $(TARGET_DIR)/usr/share/batocera/datainit/roms/arcade/cps3
		mkdir -p $(TARGET_DIR)/usr/share/batocera/datainit/roms/arcade/dataeast
		mkdir -p $(TARGET_DIR)/usr/share/batocera/datainit/roms/arcade/dynax
		mkdir -p $(TARGET_DIR)/usr/share/batocera/datainit/roms/arcade/eighting
		mkdir -p $(TARGET_DIR)/usr/share/batocera/datainit/roms/arcade/exidy
		mkdir -p $(TARGET_DIR)/usr/share/batocera/datainit/roms/arcade/gaelco
		mkdir -p $(TARGET_DIR)/usr/share/batocera/datainit/roms/arcade/gottlieb
		mkdir -p $(TARGET_DIR)/usr/share/batocera/datainit/roms/arcade/igs
		mkdir -p $(TARGET_DIR)/usr/share/batocera/datainit/roms/arcade/incredibletech
		mkdir -p $(TARGET_DIR)/usr/share/batocera/datainit/roms/arcade/irem
		mkdir -p $(TARGET_DIR)/usr/share/batocera/datainit/roms/arcade/jaleco
		mkdir -p $(TARGET_DIR)/usr/share/batocera/datainit/roms/arcade/kaneko
		mkdir -p $(TARGET_DIR)/usr/share/batocera/datainit/roms/arcade/konami
		mkdir -p $(TARGET_DIR)/usr/share/batocera/datainit/roms/arcade/midway
		mkdir -p $(TARGET_DIR)/usr/share/batocera/datainit/roms/arcade/mitchell
		mkdir -p $(TARGET_DIR)/usr/share/batocera/datainit/roms/arcade/namco
		mkdir -p $(TARGET_DIR)/usr/share/batocera/datainit/roms/arcade/nichibutsu
		mkdir -p $(TARGET_DIR)/usr/share/batocera/datainit/roms/arcade/nintendo
		mkdir -p $(TARGET_DIR)/usr/share/batocera/datainit/roms/arcade/nmk
		mkdir -p $(TARGET_DIR)/usr/share/batocera/datainit/roms/arcade/pgm
		mkdir -p $(TARGET_DIR)/usr/share/batocera/datainit/roms/arcade/playchoice
		mkdir -p $(TARGET_DIR)/usr/share/batocera/datainit/roms/arcade/psikyo
		mkdir -p $(TARGET_DIR)/usr/share/batocera/datainit/roms/arcade/sammy
		mkdir -p $(TARGET_DIR)/usr/share/batocera/datainit/roms/arcade/sega
		mkdir -p $(TARGET_DIR)/usr/share/batocera/datainit/roms/arcade/seibu
		mkdir -p $(TARGET_DIR)/usr/share/batocera/datainit/roms/arcade/semicom
		mkdir -p $(TARGET_DIR)/usr/share/batocera/datainit/roms/arcade/seta
		mkdir -p $(TARGET_DIR)/usr/share/batocera/datainit/roms/arcade/snk
		mkdir -p $(TARGET_DIR)/usr/share/batocera/datainit/roms/arcade/taito
		mkdir -p $(TARGET_DIR)/usr/share/batocera/datainit/roms/arcade/technos
		mkdir -p $(TARGET_DIR)/usr/share/batocera/datainit/roms/arcade/tecmo
		mkdir -p $(TARGET_DIR)/usr/share/batocera/datainit/roms/arcade/toaplan
		mkdir -p $(TARGET_DIR)/usr/share/batocera/datainit/roms/arcade/unico
		mkdir -p $(TARGET_DIR)/usr/share/batocera/datainit/roms/arcade/universal
		mkdir -p $(TARGET_DIR)/usr/share/batocera/datainit/roms/arcade/videosystem
		mkdir -p $(TARGET_DIR)/usr/share/batocera/datainit/roms/arcade/visco
endef

define LIBRETRO_MAME2003_PLUS_NAMCO_QUICK_FIX
	$(SED) 's|O3|O2|g' $(@D)/Makefile
	$(SED) 's|to continue|on Keyboard, or Left, Right on Joystick to continue|g' $(@D)/src/ui_text.c
endef

LIBRETRO_MAME2003_PLUS_PRE_BUILD_HOOKS += LIBRETRO_MAME2003_PLUS_NAMCO_QUICK_FIX

$(eval $(generic-package))
