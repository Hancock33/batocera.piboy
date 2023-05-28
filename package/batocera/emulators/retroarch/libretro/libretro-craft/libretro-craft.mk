################################################################################
#
# libretro-craft
#
################################################################################
# Version: Commits on May 28, 2023
LIBRETRO_CRAFT_VERSION = f511c567089f2eada95bceb604c203c1292c98e8
LIBRETRO_CRAFT_SITE = $(call github,libretro,Craft,$(LIBRETRO_CRAFT_VERSION))
LIBRETRO_CRAFT_LICENSE = MIT
LIBRETRO_CRAFT_LICENSE_FILES = LICENSE.md

ifeq ($(BR2_PACKAGE_HAS_LIBGL),y)
LIBRETRO_CRAFT_DEPENDENCIES += libgl
endif

ifeq ($(BR2_PACKAGE_HAS_LIBGLES),y)
LIBRETRO_CRAFT_DEPENDENCIES += libgles
endif

ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_BCM2835),y)
LIBRETRO_CRAFT_PLATFORM=rpi1
else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_BCM2836),y)
LIBRETRO_CRAFT_PLATFORM=rpi2
else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_BCM2837),y)
LIBRETRO_CRAFT_PLATFORM=rpi3
else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_BCM2711),y)
LIBRETRO_CRAFT_PLATFORM=rpi4
else
LIBRETRO_CRAFT_PLATFORM=$(LIBRETRO_PLATFORM)
endif

ifeq ($(BR2_arm),y)
LIBRETRO_CRAFT_OPTS += FORCE_GLES=1
endif

define LIBRETRO_CRAFT_BUILD_CMDS
	$(TARGET_CONFIGURE_OPTS) $(MAKE) CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" -C $(@D)/ -f Makefile.libretro platform="$(LIBRETRO_CRAFT_PLATFORM)" $(LIBRETRO_CRAFT_OPTS) \
	GIT_VERSION="-$(shell echo $(LIBRETRO_CRAFT_VERSION) | cut -c 1-7)"
endef

define LIBRETRO_CRAFT_INSTALL_TARGET_CMDS
	$(INSTALL) -D $(@D)/craft_libretro.so \
		$(TARGET_DIR)/usr/lib/libretro/craft_libretro.so
	# install media
    mkdir -p $(TARGET_DIR)/usr/share/emulationstation/ports/craft
	cp -a  $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/retroarch/libretro/libretro-craft/media/* $(TARGET_DIR)/usr/share/emulationstation/ports/craft/
endef

$(eval $(generic-package))
