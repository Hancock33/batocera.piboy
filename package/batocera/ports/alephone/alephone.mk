################################################################################
#
# alephone
#
################################################################################
# Version: Commits on Aug 23, 2024
ALEPHONE_VERSION = 3aef2ef5df2d145102f60278d47d8f6ca5913ccf
ALEPHONE_SITE = $(call github,Aleph-One-Marathon,alephone,$(ALEPHONE_VERSION))
ALEPHONE_DEPENDENCIES = boost ffmpeg4 sdl2 sdl2_image sdl2_ttf sdl2_net
ALEPHONE_LICENSE = GPLv3
ALEPHONE_CONF_OPTS = \
					--disable-sdltest \
					--with-sdl-prefix="$(STAGING_DIR)/usr" \
					--with-boost="$(STAGING_DIR)/usr" \
					--with-boost-libdir="$(STAGING_DIR)/usr/lib" \
					--prefix=/usr

define ALEPHONE_AUTOCONFIG
	cd $(@D) && autoreconf -f -i
endef
ALEPHONE_PRE_CONFIGURE_HOOKS += ALEPHONE_AUTOCONFIG

ALEPHONE_CONF_ENV += PKG_CONFIG_PATH="$(STAGING_DIR)/usr/lib/ffmpeg4.4/pkgconfig"
ALEPHONE_CONF_ENV += CFLAGS="-I$(STAGING_DIR)/usr/include/ffmpeg4.4:$(TARGET_CFLAGS)"
ALEPHONE_CONF_ENV += LDFLAGS="-L$(STAGING_DIR)/usr/lib/ffmpeg4.4"

define ALEPHONE_INSTALL_TARGET_CMDS
	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) install
	# evmap config
	mkdir -p $(TARGET_DIR)/usr/share/evmapy
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/ports/alephone/alephone.keys $(TARGET_DIR)/usr/share/evmapy/alephone.keys
endef

$(eval $(autotools-package))
