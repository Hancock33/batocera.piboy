################################################################################
#
# libretro-vircon32
#
################################################################################
# Version: Commits on Jan 18, 2025
LIBRETRO_VIRCON32_VERSION = d8a92430e887286b4e5351916ef0bd35d8cb40e8
LIBRETRO_VIRCON32_SITE = $(call github,vircon32,vircon32-libretro,$(LIBRETRO_VIRCON32_VERSION))
LIBRETRO_VIRCON32_SUPPORTS_IN_SOURCE_BUILD = NO
LIBRETRO_VIRCON32_LICENSE = BSD
LIBRETRO_VIRCON32_DEPENDENCIES += retroarch
LIBRETRO_VIRCON32_EMULATOR_INFO = vircon32.libretro.core.yml

ifeq ($(BR2_x86_64),y)
    LIBRETRO_VIRCON32_CONF_OPTS += -DENABLE_OPENGLES3=OFF -DENABLE_OPENGLES3=OFF
else ifeq ($(BR2_PACKAGE_BATOCERA_BCM27XX),y)
    LIBRETRO_VIRCON32_CONF_OPTS += -DENABLE_OPENGLES3=ON
else
    LIBRETRO_VIRCON32_CONF_OPTS += -DENABLE_OPENGLES2=ON
endif

define LIBRETRO_VIRCON32_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/lib/libretro
	$(INSTALL) -D $(@D)/buildroot-build/vircon32_libretro.so	$(TARGET_DIR)/usr/lib/libretro/vircon32_libretro.so
	$(INSTALL) -D $(@D)/Assets/StandardBios.v32					$(TARGET_DIR)/usr/share/batocera/datainit/bios
endef

$(eval $(cmake-package))
$(eval $(emulator-info-package))
