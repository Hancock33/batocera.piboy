################################################################################
#
# MangoHud
#
################################################################################
# Version.: Commits on Jun 24, 2021
MANGOHUD_VERSION = 88fdaa31fe7af4c2c42b07262da7e8b9f6eb2055
MANGOHUD_SITE = https://github.com/flightlessmango/MangoHud.git
MANGOHUD_SITE_METHOD = git

MANGOHUD_DEPENDENCIES = libdrm xserver_xorg-server vulkan-headers

MANGOHUD_CONF_OPTS = -Duse_system_vulkan=enabled -Dwith_xnvctrl=disabled -Dvkdatadir=$(STAGING_DIR)/usr/share

#MANGOHUD_INSTALL_STAGING = YES

#define MANGOHUD_INSTALL_STAGING_CMDS
#	cd $(@D) && \
#	CC="$(TARGET_CC)" \
#	CXX="$(TARGET_CXX)" \
#	BASE_DIR="" \
#	PREFIX="$(STAGING_DIR)/usr" \
#	PKG_CONFIG_PATH="$(STAGING_DIR)/usr/lib/pkgconfig" \
#	$(MAKE) install
#endef

#define MANGOHUD_INSTALL_TARGET_CMDS
#	$(INSTALL) -D -m 0644 $(@D)/libMANGOHUD.so $(TARGET_DIR)/usr/lib/libMANGOHUD.so
#	$(INSTALL) -D -m 0755 $(@D)/MANGOHUD $(TARGET_DIR)/usr/bin/MANGOHUD
#endef

$(eval $(meson-package))
