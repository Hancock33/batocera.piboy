################################################################################
#
# libretro-supermodel
#
################################################################################
# Version: Commits on Apr 04, 2026
LIBRETRO_SUPERMODEL_VERSION = 14a8d395526f268f61c10c3d2179bee7b73fcb8d
LIBRETRO_SUPERMODEL_SITE = $(call github,sgiannop,Libretro-Supermodel,$(LIBRETRO_SUPERMODEL_VERSION))
LIBRETRO_SUPERMODEL_LICENSE = GPL-3.0
LIBRETRO_SUPERMODEL_DEPENDENCIES += retroarch
LIBRETRO_SUPERMODEL_EMULATOR_INFO = supermodel.libretro.core.yml

ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_BCM2711),y)
    LIBRETRO_SUPERMODEL_PLATFORM = rpi64
else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_BCM2712),y)
    LIBRETRO_SUPERMODEL_PLATFORM = rpi5
else ifeq ($(BR2_x86_64),y)
    LIBRETRO_SUPERMODEL_PLATFORM = unix
else
    LIBRETRO_CRAFT_PLATFORM=$(LIBRETRO_PLATFORM)
endif

define LIBRETRO_SUPERMODEL_BUILD_CMDS
	$(SED) "s|\-O[23]|$(TARGET_OPTIMIZATION)|g" $(@D)/Makefile
	$(SED) "s|-I/usr/include||g" $(@D)/Makefile
	$(SED) "s|-L/usr/lib/aarch64-linux-gnu||g" $(@D)/Makefile
	$(TARGET_CONFIGURE_OPTS) $(MAKE) CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" -C $(@D)/ -f Makefile platform="$(LIBRETRO_SUPERMODEL_PLATFORM)"
endef

define LIBRETRO_SUPERMODEL_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/lib/libretro
	mkdir -p $(TARGET_DIR)/usr/share/libretro/info
	mkdir -p $(TARGET_DIR)/usr/share/batocera/datainit/bios/supermodel/Config
	$(INSTALL) -D $(@D)/supermodel_libretro*.so $(TARGET_DIR)/usr/lib/libretro/supermodel_libretro.so
	$(INSTALL) -D $(@D)/supermodel_libretro.info $(TARGET_DIR)/usr/share/libretro/info/supermodel_libretro.info
	cp -avr $(@D)/Config/* $(TARGET_DIR)/usr/share/batocera/datainit/bios/supermodel/Config
endef

$(eval $(generic-package))
$(eval $(emulator-info-package))
