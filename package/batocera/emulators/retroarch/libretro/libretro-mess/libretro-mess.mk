################################################################################
#
# MESS
#
################################################################################
# Version.: Commits on Jul 09, 2021
LIBRETRO_MESS_VERSION = 209cdf44db384e8fa44874753972f71a5f8ca5f9
LIBRETRO_MESS_SITE = $(call github,libretro,mame,$(LIBRETRO_MESS_VERSION))
LIBRETRO_MESS_LICENSE = MESS
LIBRETRO_MESS_DEPENDENCIES = retroarch

# Limit number of jobs not to eat too much RAM....
LIBRETRO_MESS_JOBS=24

ifeq ($(BR2_x86_64),y)
	LIBRETRO_MESS_EXTRA_ARGS += PTR64=1 LIBRETRO_CPU=x86_64 PLATFORM=x86_64
endif

ifeq ($(BR2_aarch64),y)
	LIBRETRO_MESS_EXTRA_ARGS += PTR64=1 LIBRETRO_CPU= PLATFORM=arm64
	# workaround for asmjit broken build system (arm backend is not public)
	LIBRETRO_MESS_ARCHOPTS += -D__aarch64__ -DASMJIT_BUILD_X86
endif

define LIBRETRO_MESS_BUILD_CMDS
		#create some dirs while with parallelism, sometimes it fails because this directory is missing
		mkdir -p $(@D)/build/libretro/obj/x64/libretro/src/osd/libretro/libretro-internal

		$(MAKE) -j$(LIBRETRO_MESS_JOBS) -C $(@D)/ OPENMP=1 REGENIE=1 VERBOSE=1 NOWERROR=1 PYTHON_EXECUTABLE=python3            \
		CONFIG=libretro LIBRETRO_OS="unix" ARCH="" PROJECT="" ARCHOPTS="$(LIBRETRO_MESS_ARCHOPTS)" \
		DISTRO="debian-stable" OVERRIDE_CC="$(TARGET_CC)" OVERRIDE_CXX="$(TARGET_CXX)"             \
		OVERRIDE_LD="$(TARGET_LD)" RANLIB="$(TARGET_RANLIB)" AR="$(TARGET_AR)"                     \
		$(LIBRETRO_MESS_EXTRA_ARGS) CROSS_BUILD=1 SUBTARGET="mess" RETRO=1 DEBUG=0 DEPRECATED=0
endef

define LIBRETRO_MESS_INSTALL_TARGET_CMDS
		$(INSTALL) -D $(@D)/mess_libretro.so \
		$(TARGET_DIR)/usr/lib/libretro/mess_libretro.so
endef

define LIBRETRO_MESS_INSTALL_STAGING_CMDS
		$(INSTALL) -D $(@D)/mess_libretro.so \
		$(STAGING_DIR)/usr/lib/libretro/mess_libretro.so
endef

$(eval $(generic-package))

