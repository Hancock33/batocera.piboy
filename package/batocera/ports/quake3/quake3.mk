################################################################################
#
# Quake 3
#
################################################################################
# Version.: Commits on Aug 28, 2021
QUAKE3_VERSION = ec8089b0940b973fab28b88267b1571af4ae9b3f
QUAKE3_SITE = $(call github,suijingfeng,vkQuake3,$(QUAKE3_VERSION))

QUAKE3_DEPENDENCIES = sdl2 sdl2_mixer
QUAKE3_LICENSE = GPL-2.0

ifeq ($(BR2_PACKAGE_XPI_GAMECON_RPI3)$(BR2_PACKAGE_XPI_GAMECON_RPI4),y)
    Q3_COMPILE_ARCH=arm64
else
    Q3_COMPILE_ARCH=x86_64
endif

define QUAKE3_BUILD_CMDS
	$(TARGET_CONFIGURE_OPTS) $(MAKE) CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" -C $(@D)/ -f Makefile \
	DEFAULT_BASEDIR=/userdata/roms/quake3 \
	COMPILE_ARCH="$(Q3_COMPILE_ARCH)"
endef

define QUAKE3_INSTALL_TARGET_CMDS
    mkdir -p $(TARGET_DIR)/usr/share/batocera/datainit/roms/quake3/baseq3
    cp -pvr $(@D)/build/release-linux-*/ioquake3.* $(TARGET_DIR)/usr/bin/ioquake3
    cp -pvr $(@D)/build/release-linux-*/renderer_*.so $(TARGET_DIR)/usr/share/batocera/datainit/roms/quake3
	cp -pvr $(@D)/build/release-linux-*/baseq3/*.so $(TARGET_DIR)/usr/share/batocera/datainit/roms/quake3/baseq3
    # evmap config
	mkdir -p $(TARGET_DIR)/usr/share/evmapy
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/ports/quake3/quake3.keys $(TARGET_DIR)/usr/share/evmapy
endef

$(eval $(generic-package))
