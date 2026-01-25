################################################################################
#
# alephone
#
################################################################################
# Version: Commits on Jan 24, 2026
ALEPHONE_VERSION = 82d09f77fd982f25bb4f225143e11f243b8f1013
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
