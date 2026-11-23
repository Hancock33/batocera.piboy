################################################################################
#
# dxx-rebirth
#
################################################################################
# Version: Commits on Nov 22, 2026
DXX_REBIRTH_VERSION = ab9247ae8f205fe41cefc27b8284c1fcd2f49e85
DXX_REBIRTH_SITE = $(call github,dxx-rebirth,dxx-rebirth,$(DXX_REBIRTH_VERSION))
DXX_REBIRTH_LICENSE = GPL-3.0
DXX_REBIRTH_LICENSE_FILES = COPYING.txt
DXX_REBIRTH_EMULATOR_INFO = dxx-rebirth.emulator.yml
DXX_REBIRTH_DEPENDENCIES = host-scons sdl2 sdl2_image sdl2_mixer libpng physfs libglu

DXX_REBIRTH_SCONS_ENV = $(TARGET_CONFIGURE_OPTS)

DXX_REBIRTH_SCONS_OPTS = -j$(PARALLEL_JOBS) sdl2=yes

ifeq ($(BR2_PACKAGE_LIBGLEW),y)
    DXX_REBIRTH_DEPENDENCIES += libglew
endif

define DXX_REBIRTH_BUILD_CMDS
	(cd $(@D); \
		PKG_CONFIG_PATH="$(STAGING_DIR)/usr/lib/pkgconfig" \
		$(DXX_REBIRTH_SCONS_ENV) \
		CFLAGS="$(subst Os,O2,$(TARGET_CFLAGS)) -funsigned-char" \
		CXXFLAGS="$(subst Os,O2,$(TARGET_CXXFLAGS)) -funsigned-char" \
		$(SCONS) \
		$(DXX_REBIRTH_SCONS_OPTS))
endef

define DXX_REBIRTH_INSTALL_TARGET_CMDS
	$(INSTALL) -m 0755 -D -t $(TARGET_DIR)/usr/bin \
		$(@D)/build/d1x-rebirth/d1x-rebirth \
		$(@D)/build/d2x-rebirth/d2x-rebirth
endef

define DXX_REBIRTH_EVMAPY
	$(INSTALL) -m 0644 -D -t $(TARGET_DIR)/usr/share/evmapy $(DXX_REBIRTH_PKGDIR)/dxx-rebirth.keys
endef

DXX_REBIRTH_POST_INSTALL_TARGET_HOOKS += DXX_REBIRTH_EVMAPY

$(eval $(generic-package))
$(eval $(emulator-info-package))
