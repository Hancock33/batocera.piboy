################################################################################
#
# libretro-smsplus-gx
#
################################################################################
# Version: Commits on Jul 22, 2024
LIBRETRO_SMSPLUS_GX_VERSION = 29cd96822f5e9b71a8ccfa13a38c6c37ed83ccac
LIBRETRO_SMSPLUS_GX_SITE = $(call github,libretro,smsplus-gx,$(LIBRETRO_SMSPLUS_GX_VERSION))
LIBRETRO_SMSPLUS_GX_LICENSE = Non-commercial

LIBRETRO_SMSPLUS_GX_PLATFORM = $(LIBRETRO_PLATFORM)

ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_BCM2835),y)
LIBRETRO_SMSPLUS_GX_PLATFORM = rpi1
else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_BCM2836),y)
LIBRETRO_SMSPLUS_GX_PLATFORM = rpi2
else ifeq ($(BR2_aarch64),y)
LIBRETRO_SMSPLUS_GX_PLATFORM = unix
endif

define LIBRETRO_SMSPLUS_GX_BUILD_CMDS
	$(SED) "s|\-O[23]|$(TARGET_OPTIMIZATION)|g" $(@D)/Makefile.libretro
	$(TARGET_CONFIGURE_OPTS) $(MAKE) CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" \
	-C $(@D) -f Makefile.libretro platform="$(LIBRETRO_SMSPLUS_GX_PLATFORM)" \
	GIT_VERSION="-$(shell echo $(LIBRETRO_SMSPLUS_GX_VERSION) | cut -c 1-7)"
endef

define LIBRETRO_SMSPLUS_GX_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/lib/libretro
	$(INSTALL) -D $(@D)/smsplus_libretro.so $(TARGET_DIR)/usr/lib/libretro/smsplus_libretro.so
endef

$(eval $(generic-package))
