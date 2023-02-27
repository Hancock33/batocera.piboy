################################################################################
#
# libretro-same-cdi
#
################################################################################
# Version: Commits on Feb 27, 2023
LIBRETRO_SAME_CDI_VERSION = db6b9c3d07e3a77dd6260b4428199aa7d65e84b0
LIBRETRO_SAME_CDI_SITE = $(call github,libretro,same_cdi,$(LIBRETRO_SAME_CDI_VERSION))
LIBRETRO_SAME_CDI_LICENSE = GPL

ifeq ($(BR2_x86_64),y)
LIBRETRO_SAME_CDI_EXTRA_ARGS += PTR64=1 LIBRETRO_CPU=x86_64 PLATFORM=x86_64
else ifeq ($(BR2_i386),y)
LIBRETRO_SAME_CDI_EXTRA_ARGS += PTR64=0 LIBRETRO_CPU=x86 PLATFORM=x86
else ifeq ($(BR2_arm),y)
LIBRETRO_SAME_CDI_EXTRA_ARGS += PTR64=0 LIBRETRO_CPU=arm PLATFORM=arm
# workaround for asmjit broken build system (arm backend is not public)
LIBRETRO_SAME_CDI_ARCHOPTS += -D__arm__ -DASMJIT_BUILD_X86
else ifeq ($(BR2_aarch64),y)
LIBRETRO_SAME_CDI_EXTRA_ARGS += PTR64=1 LIBRETRO_CPU= PLATFORM=arm64
# workaround for asmjit broken build system (arm backend is not public)
LIBRETRO_SAME_CDI_ARCHOPTS += -D__aarch64__ -DASMJIT_BUILD_X86
endif

define LIBRETRO_SAME_CDI_BUILD_CMDS
	$(MAKE) -C $(@D)/ OPENMP=1 REGENIE=1 VERBOSE=1 NOWERROR=1 PYTHON_EXECUTABLE=python3 \
		CONFIG=libretro LIBRETRO_OS="unix" ARCH="" PROJECT="" ARCHOPTS="$(LIBRETRO_MAME_ARCHOPTS)" \
		DISTRO="debian-stable" OVERRIDE_CC="$(TARGET_CC)" OVERRIDE_CXX="$(TARGET_CXX)"             \
		OVERRIDE_LD="$(TARGET_LD)" RANLIB="$(TARGET_RANLIB)" AR="$(TARGET_AR)"                     \
		$(LIBRETRO_MAME_EXTRA_ARGS) CROSS_BUILD=1 RETRO=1 OSD="retro" DEBUG=0 NOWERROR=1           \
		-f Makefile.libretro
endef

define LIBRETRO_SAME_CDI_INSTALL_TARGET_CMDS
	$(INSTALL) -D $(@D)/same_cdi_libretro.so \
		$(TARGET_DIR)/usr/lib/libretro/same_cdi_libretro.so
endef

$(eval $(generic-package))
