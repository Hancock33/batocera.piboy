################################################################################
#
# alephone
#
################################################################################
# Version: Commits on Nov 06, 2022
ALEPHONE_VERSION = 93dc3945044f552e915a34bb4dbb273872455a3d
ALEPHONE_SITE = $(call github,Aleph-One-Marathon,alephone,$(ALEPHONE_VERSION))

ALEPHONE_DEPENDENCIES = sdl2 sdl2_image sdl2_ttf sdl2_net
ALEPHONE_LICENSE = GPLv3

define ALEPHONE_BUILD_CMDS
	cd $(@D) && \
	autoreconf -f -i && \
	PATH=$(BR_PATH) ./configure --disable-sdltest \
	                            --with-sdl-prefix="$(STAGING_DIR)/usr" \
	                            --with-boost="$(STAGING_DIR)/usr" \
	                            --with-boost-libdir="$(STAGING_DIR)/usr/lib" \
	                            --prefix=/usr \
	                            --without-miniupnpc && \
	$(TARGET_CONFIGURE_OPTS) $(MAKE) \
		CPP="$(TARGET_CPP)" CXX="$(TARGET_CXX) -lGLU" CC="$(TARGET_CC)" \
		AS="$(TARGET_CC)" LD="$(TARGET_LD)" STRIP="$(TARGET_STRIP)" \
		-C $(@D)
endef

define ALEPHONE_INSTALL_TARGET_CMDS
	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) \
		STRIP=/bin/true \
		DESTDIR=$(TARGET_DIR) \
		install
	# evmap config
	mkdir -p $(TARGET_DIR)/usr/share/evmapy
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/ports/alephone/alephone.keys $(TARGET_DIR)/usr/share/evmapy/alephone.keys
endef

$(eval $(generic-package))

