################################################################################
#
# libretro-vircon32
#
################################################################################
# Version: Commits on Mar 04, 2024
LIBRETRO_VIRCON32_VERSION = 56c429aa001c9f76c7a96e656f82d7e60c34bc81
LIBRETRO_VIRCON32_SITE = https://github.com/vircon32/vircon32-libretro.git
LIBRETRO_VIRCON32_SITE_METHOD=git
LIBRETRO_VIRCON32_GIT_SUBMODULES=YES
LIBRETRO_VIRCON32_LICENSE = BSD
LIBRETRO_VIRCON32_SUPPORTS_IN_SOURCE_BUILD = NO

ifeq ($(BR2_x86_64),y)
	LIBRETRO_VIRCON32_CONF_OPTS +=  -DENABLE_OPENGLES3=OFF -DENABLE_OPENGLES3=OFF
else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_BCM2711),y)
	LIBRETRO_VIRCON32_CONF_OPTS += -DENABLE_OPENGLES3=ON
else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_BCM2712),y)
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
