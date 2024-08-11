################################################################################
#
# dxx-rebirth
#
################################################################################
# Version: Commits on Jul 21, 2024
DXX_REBIRTH_VERSION = 5b8dc756f67d3077cfe171838aa15c798cc67c98
DXX_REBIRTH_SITE = $(call github,dxx-rebirth,dxx-rebirth,$(DXX_REBIRTH_VERSION))
DXX_REBIRTH_LICENSE = GPLv3
DXX_REBIRTH_LICENSE_FILE = COPYING.txt
DXX_REBIRTH_DEPENDENCIES = host-scons sdl2 sdl2_image sdl2_mixer libpng physfs

DXX_REBIRTH_SCONS_ENV = $(TARGET_CONFIGURE_OPTS)

DXX_REBIRTH_SCONS_OPTS = -j$(PARALLEL_JOBS) sdl2=yes

# dxx-rebirth currently does not support sdl2 + opengles combo
ifneq ($(BR2_PACKAGE_HAS_LIBGL),y)
DXX_REBIRTH_SCONS_OPTS += opengles=yes
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
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/ports/dxx-rebirth/dxx-rebirth.keys \
		$(TARGET_DIR)/usr/share/evmapy
endef

DXX_REBIRTH_POST_INSTALL_TARGET_HOOKS += DXX_REBIRTH_EVMAPY

$(eval $(generic-package))
