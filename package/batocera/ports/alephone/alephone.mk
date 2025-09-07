################################################################################
#
# alephone
#
################################################################################
# Version: Commits on Sept 04, 2025
ALEPHONE_VERSION = 64123217a7275aba951e22ab5e18aff36c54df74
ALEPHONE_SITE = $(call github,Aleph-One-Marathon,alephone,$(ALEPHONE_VERSION))
ALEPHONE_DEPENDENCIES = boost sdl2 sdl2_image sdl2_ttf
ALEPHONE_LICENSE = GPLv3
ALEPHONE_CONF_OPTS = \
					--disable-sdltest \
					--with-sdl-prefix="$(STAGING_DIR)/usr" \
					--with-boost="$(STAGING_DIR)/usr" \
					--with-boost-libdir="$(STAGING_DIR)/usr/lib" \
					--prefix=/usr

define ALEPHONE_AUTOCONFIG
	cd $(@D) && PATH=/usr/bin autoreconf -f -i
endef
ALEPHONE_PRE_CONFIGURE_HOOKS += ALEPHONE_AUTOCONFIG

define ALEPHONE_INSTALL_TARGET_CMDS
	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) install
endef

$(eval $(autotools-package))
