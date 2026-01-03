################################################################################
#
# libretro-sameboy
#
################################################################################
# Version: Commits on Jan 03, 2026
LIBRETRO_SAMEBOY_VERSION = 10a869edf57fead4b9dd151b6229779a5e7c276c
LIBRETRO_SAMEBOY_SITE = $(call github,LIJI32,SameBoy,$(LIBRETRO_SAMEBOY_VERSION))
LIBRETRO_SAMEBOY_LICENSE = GPL
LIBRETRO_SAMEBOY_DEPENDENCIES = host-rgbds

ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_BCM2711),y)
    LIBRETRO_SAMEBOY_EXTRA_ARGS=ARCH=aarch64
    LIBRETRO_SAMEBOY_PLATFORM=rpi4_64
else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_BCM2837),y)
    LIBRETRO_SAMEBOY_EXTRA_ARGS=ARCH=aarch64
    LIBRETRO_SAMEBOY_PLATFORM=unix
else
    LIBRETRO_SAMEBOY_PLATFORM=$(LIBRETRO_PLATFORM)
endif

define LIBRETRO_SAMEBOY_BUILD_CMDS
	$(SED) "s|\-O[23]|$(TARGET_OPTIMIZATION)|g" $(@D)/libretro/Makefile
	$(TARGET_CONFIGURE_OPTS) $(MAKE) CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" -C $(@D) platform="$(LIBRETRO_SAMEBOY_PLATFORM)" \
		$(LIBRETRO_SAMEBOY_EXTRA_ARGS) GIT_VERSION="-$(shell echo $(LIBRETRO_SAMEBOY_VERSION) | cut -c 1-7)" \
		bootroms libretro
endef

define LIBRETRO_SAMEBOY_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/lib/libretro
	$(INSTALL) -D $(@D)/build/bin/sameboy_libretro.so $(TARGET_DIR)/usr/lib/libretro/sameboy_libretro.so
endef

$(eval $(generic-package))
