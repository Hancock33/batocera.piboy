################################################################################
#
# libretro-nestopia
#
################################################################################
# Version: Commits on Feb 12, 2024
LIBRETRO_NESTOPIA_VERSION = 1ae59e352b12aa2b0e5b4576bb3a6bb6982db711
LIBRETRO_NESTOPIA_SITE = $(call github,libretro,nestopia,$(LIBRETRO_NESTOPIA_VERSION))
LIBRETRO_NESTOPIA_LICENSE = GPLv2

LIBRETRO_NESTOPIA_PLATFORM = $(LIBRETRO_PLATFORM)

ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_S812),y)
LIBRETRO_NESTOPIA_PLATFORM = armv
else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_BCM2835),y)
LIBRETRO_NESTOPIA_PLATFORM = rpi1
else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_BCM2836),y)
LIBRETRO_NESTOPIA_PLATFORM = rpi2
else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_BCM2837),y)
LIBRETRO_NESTOPIA_PLATFORM = rpi3_64
else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_BCM2711),y)
LIBRETRO_NESTOPIA_PLATFORM = rpi4_64
else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_BCM2712),y)
LIBRETRO_NESTOPIA_PLATFORM = rpi5_64
else ifeq ($(BR2_aarch64),y)
LIBRETRO_NESTOPIA_PLATFORM = unix
endif

define LIBRETRO_NESTOPIA_BUILD_CMDS
	$(SED) "s|-O2|$(TARGET_OPTIMIZATION)|g" $(@D)/libretro/Makefile
	$(SED) "s|-O3|$(TARGET_OPTIMIZATION)|g" $(@D)/libretro/Makefile
	$(TARGET_CONFIGURE_OPTS) $(MAKE) CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" \
	-C $(@D)/libretro/ platform="$(LIBRETRO_NESTOPIA_PLATFORM)" \
		GIT_VERSION="-$(shell echo $(LIBRETRO_NESTOPIA_VERSION) | cut -c 1-7)"
endef

define LIBRETRO_NESTOPIA_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/lib/libretro
	$(INSTALL) -D $(@D)/libretro/nestopia_libretro.so $(TARGET_DIR)/usr/lib/libretro/nestopia_libretro.so

	# Bios
	mkdir -p                            $(TARGET_DIR)/usr/share/batocera/datainit/bios
	$(INSTALL) -D $(@D)/NstDatabase.xml $(TARGET_DIR)/usr/share/batocera/datainit/bios/NstDatabase.xml
endef

$(eval $(generic-package))
