################################################################################
#
# alephone
#
################################################################################
# Version: Commits on Aug 30, 2024
ALEPHONE_VERSION = f54650be32dbf40e148ea0324699f65fd8cd11b1
ALEPHONE_SITE = $(call github,Aleph-One-Marathon,alephone,$(ALEPHONE_VERSION))
ALEPHONE_DEPENDENCIES = boost ffmpeg sdl2 sdl2_image sdl2_ttf sdl2_net
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

define ALEPHONE_INSTALL_TARGET_CMDS
	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) install
	# evmap config
	mkdir -p $(TARGET_DIR)/usr/share/evmapy
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/ports/alephone/alephone.keys $(TARGET_DIR)/usr/share/evmapy/alephone.keys
endef

$(eval $(autotools-package))
