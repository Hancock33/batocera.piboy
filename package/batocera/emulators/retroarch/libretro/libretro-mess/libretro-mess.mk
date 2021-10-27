################################################################################
#
# MESS
#
################################################################################
# Version.: Commits on Oct 05, 2021
LIBRETRO_MESS_VERSION = 0eab2fef2835b1ce2d954116287e845c0bacbb21
LIBRETRO_MESS_SITE = $(call github,libretro,mame,$(LIBRETRO_MESS_VERSION))
LIBRETRO_MESS_LICENSE = MESS
LIBRETRO_MESS_DEPENDENCIES = retroarch

# Limit number of jobs not to eat too much RAM....
LIBRETRO_MESS_JOBS=30

ifeq ($(BR2_x86_64),y)
	LIBRETRO_MESS_EXTRA_ARGS += PTR64=1 NOASM=0 LIBRETRO_CPU=x86_64 PLATFORM=x86_64
endif

ifeq ($(BR2_aarch64),y)
	LIBRETRO_MESS_EXTRA_ARGS += PTR64=1 NOASM=1 PTR64=1 LIBRETRO_CPU=arm64 PLATFORM=arm64
	# workaround for asmjit broken build system (arm backend is not public)
	LIBRETRO_MESS_ARCHOPTS += -D__aarch64__ -DASMJIT_BUILD_X86
endif

define LIBRETRO_MESS_BUILD_CMDS
		#create some dirs while with parallelism, sometimes it fails because this directory is missing
		mkdir -p $(@D)/build/libretro/obj/x64/libretro/src/osd/libretro/libretro-internal

		$(MAKE) -j$(LIBRETRO_MESS_JOBS) -C $(@D)/ $(LIBRETRO_MESS_EXTRA_ARGS) ARCHOPTS="$(LIBRETRO_MESS_ARCHOPTS)" \
			OVERRIDE_CC="$(TARGET_CC)" OVERRIDE_CXX="$(TARGET_CXX)"             \
			OVERRIDE_LD="$(TARGET_LD)" RANLIB="$(TARGET_RANLIB)" AR="$(TARGET_AR)"  \
			REGENIE=1 \
			VERBOSE=1 \
			NOWERROR=1 \
			OPENMP=1 \
			PYTHON_EXECUTABLE=python3 \
			CONFIG=libretro \
			LIBRETRO_OS=unix \
			ARCH= \
			TARGET=mame \
			SUBTARGET=mess \
			CROSS_BUILD=1 \
			TOOLS=1 \
			RETRO=1 \
			OSD=retro \
			USE_SYSTEM_LIB_EXPAT=1 \
			USE_SYSTEM_LIB_ZLIB=1 \
			USE_SYSTEM_LIB_FLAC=1 \
			USE_SYSTEM_LIB_SQLITE3=1
endef

define LIBRETRO_MESS_INSTALL_TARGET_CMDS
		$(INSTALL) -D $(@D)/mess_libretro.so \
		$(TARGET_DIR)/usr/lib/libretro/mess_libretro.so
		mkdir -p $(TARGET_DIR)/usr/share/batocera/datainit/bios/mame/samples
		cp -r $(@D)/hash $(TARGET_DIR)/usr/share/batocera/datainit/bios/mame
		mkdir -p $(TARGET_DIR)/usr/share/batocera/datainit/roms
		cp -pvr $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/retroarch/libretro/libretro-mess/roms/mess $(TARGET_DIR)/usr/share/batocera/datainit/roms
		mkdir -p $(TARGET_DIR)/usr/share/batocera/datainit/system/configs/emulationstation
		cp -avr $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/retroarch/libretro/libretro-mess/es_systems_mess_*.cfg $(TARGET_DIR)/usr/share/batocera/datainit/system/configs/emulationstation
endef

define LIBRETRO_MESS_INSTALL_STAGING_CMDS
		$(INSTALL) -D $(@D)/mess_libretro.so \
		$(STAGING_DIR)/usr/lib/libretro/mess_libretro.so
endef

$(eval $(generic-package))
