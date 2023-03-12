################################################################################
#
# alephone
#
################################################################################
# Version: Commits on Mar 12, 2023
ALEPHONE_VERSION = 0009c18b0c3baa3cd259411f2ae0831dd2c749b3
ALEPHONE_SITE = $(call github,Aleph-One-Marathon,alephone,$(ALEPHONE_VERSION))

ALEPHONE_DEPENDENCIES = boost sdl2 sdl2_image sdl2_ttf sdl2_net
ALEPHONE_LICENSE = GPLv3
#ALEPHONE_AUTORECONF = YES
ALEPHONE_SUPPORTS_IN_SOURCE_BUILD = NO
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
