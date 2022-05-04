################################################################################
#
# ALEPHONE
#
################################################################################
# Version: Commits on Apr 21, 2022
ALEPHONE_VERSION = 59bc4c466bc2223edb2b2b812a56a994644bac23
ALEPHONE_SITE = $(call github,Aleph-One-Marathon,alephone,$(ALEPHONE_VERSION))

ALEPHONE_DEPENDENCIES = sdl2 sdl2_image sdl2_ttf sdl2_net
ALEPHONE_LICENSE = GPLv3

define ALEPHONE_BUILD_CMDS
	cd $(@D) && \
	PATH=$(BR_PATH) ./autogen.sh --disable-sdltest \
	                             --with-sdl-prefix="$(STAGING_DIR)/usr" \
	                             --with-boost-libdir="$(STAGING_DIR)/usr/lib" \
	                             --prefix=/usr && \
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

