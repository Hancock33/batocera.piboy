################################################################################
#
# LIBRETRO PC88
#
################################################################################
# Version.: Commits on Dec 10, 2021
LIBRETRO_PC88_VERSION = 8b64fbad65c17374cbf88924a7270616ed289828
LIBRETRO_PC88_SITE = $(call github,libretro,quasi88-libretro,$(LIBRETRO_PC88_VERSION))
LIBRETRO_PC88_LICENSE = BSD 3-Clause

LIBRETRO_PC88_PLATFORM = $(LIBRETRO_PLATFORM)

ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_RPI1),y)
LIBRETRO_PC88_PLATFORM = unix-rpi1

else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_RPI2),y)
LIBRETRO_PC88_PLATFORM = unix-rpi2

else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_RPI3)$(BR2_PACKAGE_BATOCERA_TARGET_RPIZERO2),y)
    ifeq ($(BR2_arm),y)
        LIBRETRO_PC88_PLATFORM = unix-rpi3
    else
        LIBRETRO_PC88_PLATFORM = unix-rpi3_64
    endif

else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_RPI4),y)
LIBRETRO_PC88_PLATFORM = unix-rpi4
endif

define LIBRETRO_PC88_BUILD_CMDS
	$(TARGET_CONFIGURE_OPTS) $(MAKE) CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" -C $(@D)/ -f Makefile platform="$(LIBRETRO_PC88_PLATFORM)"
endef

define LIBRETRO_PC88_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/share/batocera/datainit/bios/quasi88
	$(INSTALL) -D $(@D)/quasi88_libretro.so \
		$(TARGET_DIR)/usr/lib/libretro/quasi88_libretro.so
endef

$(eval $(generic-package))
