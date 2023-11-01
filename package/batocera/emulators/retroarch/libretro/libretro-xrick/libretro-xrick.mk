################################################################################
#
# libretro-xrick
#
################################################################################
# Version: Commits on Nov 01, 2023
LIBRETRO_XRICK_VERSION = 58e544ee8de08ca8421e97c064d52ef6cdd73bd2
LIBRETRO_XRICK_SITE = $(call github,libretro,xrick-libretro,$(LIBRETRO_XRICK_VERSION))
LIBRETRO_XRICK_LICENSE = GPL-3.0

define LIBRETRO_XRICK_BUILD_CMDS
	$(SED) "s|-O2|$(TARGET_OPTIMIZATION)|g" $(@D)/Makefile.libretro
	$(SED) "s|-O3|$(TARGET_OPTIMIZATION)|g" $(@D)/Makefile.libretro
	$(TARGET_CONFIGURE_OPTS) $(MAKE) CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" -C $(@D)/ -f Makefile.libretro platform="unix"
endef

define LIBRETRO_XRICK_INSTALL_TARGET_CMDS
	$(INSTALL) -D $(@D)/xrick_libretro.so \
	$(TARGET_DIR)/usr/lib/libretro/xrick_libretro.so
	# install media
	mkdir -p $(TARGET_DIR)/usr/share/emulationstation/ports/xrick
	cp -a  $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/retroarch/libretro/libretro-xrick/media/* $(TARGET_DIR)/usr/share/emulationstation/ports/xrick/
endef

$(eval $(generic-package))
