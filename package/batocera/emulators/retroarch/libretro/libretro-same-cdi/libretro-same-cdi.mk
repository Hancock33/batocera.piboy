################################################################################
#
# libretro-same-cdi
#
################################################################################
# Version: Commits on Feb 28, 2023
LIBRETRO_SAME_CDI_VERSION = 54cf493c2dee4c46666059c452f8aaaa0bd7c8e0
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
	$(SED) "s|-O2|$(TARGET_OPTIMIZATION)|g" $(@D)/Makefile.libretro
	$(SED) "s|-O3|$(TARGET_OPTIMIZATION)|g" $(@D)/Makefile.libretro

	# First, we need to build genie for host
	cd $(@D); \
	PATH="$(HOST_DIR)/bin:$$PATH" \
	$(MAKE) TARGETOS=linux OSD=sdl genie \
	TARGET=mame SUBTARGET=tiny \
	NO_USE_PORTAUDIO=1 NO_X11=1 USE_SDL=0 \
	USE_QTDEBUG=0 DEBUG=0 IGNORE_GIT=1 MPARAM="" OPTIMIZE=s

	# Then build lr-same-cdi for target
	$(TARGET_CONFIGURE_OPTS) $(MAKE) CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" GIT_VERSION="" $(LIBRETRO_SAME_CDI_EXTRA_ARGS) OPTIMIZE=s -C $(@D) -f Makefile.libretro
endef

define LIBRETRO_SAME_CDI_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/lib/libretro
	$(INSTALL) -D $(@D)/same_cdi_libretro.so $(TARGET_DIR)/usr/lib/libretro/same_cdi_libretro.so
endef

$(eval $(generic-package))
