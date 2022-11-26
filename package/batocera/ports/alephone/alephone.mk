################################################################################
#
# alephone
#
################################################################################
# Version: Commits on Nov 26, 2022
ALEPHONE_VERSION = 84d1cf266dcd83ba844727588562122bcb680cf1
ALEPHONE_SITE = $(call github,Aleph-One-Marathon,alephone,$(ALEPHONE_VERSION))

ALEPHONE_DEPENDENCIES = boost sdl2 sdl2_image sdl2_ttf sdl2_net
ALEPHONE_LICENSE = GPLv3
ALEPHONE_CONF_OPTS = \
	                --disable-sdltest \
	                --with-sdl-prefix="$(STAGING_DIR)/usr" \
	                --with-boost="$(STAGING_DIR)/usr" \
	                --with-boost-libdir="$(STAGING_DIR)/usr/lib" \
	                --prefix=/usr \
	                --without-miniupnpc

define ALEPHONE_INSTALL_TARGET_CMDS
	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) STRIP=/bin/true DESTDIR=$(TARGET_DIR) install
	# evmap config
	mkdir -p $(TARGET_DIR)/usr/share/evmapy
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/ports/alephone/alephone.keys $(TARGET_DIR)/usr/share/evmapy/alephone.keys
endef

$(eval $(autotools-package))
