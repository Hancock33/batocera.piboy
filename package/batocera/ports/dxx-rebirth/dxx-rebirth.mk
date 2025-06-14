################################################################################
#
# dxx-rebirth
#
################################################################################
# Version: Commits on May 24, 2025
DXX_REBIRTH_VERSION = 7a84b3f307ac6f72fd440e55b149d7c2c942dfaf
DXX_REBIRTH_SITE = $(call github,dxx-rebirth,dxx-rebirth,$(DXX_REBIRTH_VERSION))
DXX_REBIRTH_LICENSE = GPLv3
DXX_REBIRTH_LICENSE_FILE = COPYING.txt
DXX_REBIRTH_DEPENDENCIES = host-scons sdl2 sdl2_image sdl2_mixer libpng physfs libglu

DXX_REBIRTH_LDFLAGS   = $(TARGET_LDFLAGS)
DXX_REBIRTH_CFLAGS    = $(TARGET_CFLAGS)
DXX_REBIRTH_CXXFLAGS  = $(TARGET_CXXFLAGS)
DXX_REBIRTH_SCONS_ENV = $(TARGET_CONFIGURE_OPTS)

DXX_REBIRTH_SCONS_OPTS = -j$(PARALLEL_JOBS) sdl2=yes

ifeq ($(BR2_PACKAGE_LIBGLEW),y)
    DXX_REBIRTH_DEPENDENCIES += libglew
endif

ifeq ($(BR2_PACKAGE_LIBGLU),y)
    DXX_REBIRTH_DEPENDENCIES += libglu
endif

define DXX_REBIRTH_BUILD_CMDS
	(cd $(@D); \
		PKG_CONFIG_PATH="$(STAGING_DIR)/usr/lib/pkgconfig" \
		$(DXX_REBIRTH_SCONS_ENV) \
		CFLAGS="$(subst Os,O2,$(TARGET_CFLAGS)) -funsigned-char -Wno-narrowing" \
		CXXFLAGS="$(subst Os,O2,$(TARGET_CFLAGS)) -funsigned-char -Wno-narrowing" \
		$(SCONS) \
		$(DXX_REBIRTH_SCONS_OPTS))
endef

define DXX_REBIRTH_INSTALL_TARGET_CMDS
	cp $(@D)/build/d1x-rebirth/d1x-rebirth $(TARGET_DIR)/usr/bin/
	cp $(@D)/build/d2x-rebirth/d2x-rebirth $(TARGET_DIR)/usr/bin/
endef

define DXX_REBIRTH_EVMAPY
	mkdir -p $(TARGET_DIR)/usr/share/evmapy
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/ports/dxx-rebirth/dxx-rebirth.keys $(TARGET_DIR)/usr/share/evmapy
endef

DXX_REBIRTH_POST_INSTALL_TARGET_HOOKS += DXX_REBIRTH_EVMAPY

$(eval $(generic-package))
