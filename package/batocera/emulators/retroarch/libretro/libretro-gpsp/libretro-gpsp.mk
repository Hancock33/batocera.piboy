################################################################################
#
# libretro-gpsp
#
################################################################################
# Version: Commits on Jun 04, 2026
LIBRETRO_GPSP_VERSION = 2db57b11a437c4432ab69823bdcd951181de6213
LIBRETRO_GPSP_SITE = $(call github,libretro,gpsp,$(LIBRETRO_GPSP_VERSION))
LIBRETRO_GPSP_LICENSE = GPLv2
LIBRETRO_GPSP_DEPENDENCIES += retroarch
LIBRETRO_GPSP_EMULATOR_INFO = gpsp.libretro.core.yml

ifeq ($(BR2_aarch64),y)
    LIBRETRO_GPSP_PLATFORM = arm64
else ifeq ($(BR2_arm),y)
    LIBRETRO_GPSP_PLATFORM = arm
else
    LIBRETRO_GPSP_PLATFORM = unix
endif

define LIBRETRO_GPSP_BUILD_CMDS
	$(SED) "s|\-O[23]|$(TARGET_OPTIMIZATION)|g" $(@D)/Makefile
	$(TARGET_CONFIGURE_OPTS) $(MAKE) CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" -C $(@D) platform=$(LIBRETRO_GPSP_PLATFORM) \
		GIT_VERSION="-$(shell echo $(LIBRETRO_GPSP_VERSION) | cut -c 1-7)"
endef

define LIBRETRO_GPSP_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/lib/libretro
	$(INSTALL) -D $(@D)/gpsp_libretro.so $(TARGET_DIR)/usr/lib/libretro/gpsp_libretro.so
endef

$(eval $(generic-package))
$(eval $(emulator-info-package))
