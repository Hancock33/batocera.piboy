################################################################################
#
# alephone
#
################################################################################
# Version: Commits on Feb 10, 2026
ALEPHONE_VERSION = bc450f8949dd82509ad34cc8e6b2828648bd41cb
ALEPHONE_SITE = $(call github,Aleph-One-Marathon,alephone,$(ALEPHONE_VERSION))
ALEPHONE_EMULATOR_INFO = alephone.emulator.yml
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
$(eval $(emulator-info-package))
