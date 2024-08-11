################################################################################
#
# mangohud
#
################################################################################
# Version: Commits from Jun 15, 2024
MANGOHUD_VERSION = 12620c91eaca0917a7939a92ec33915cadf24475
MANGOHUD_SITE =  $(call github,flightlessmango,MangoHud,$(MANGOHUD_VERSION))
MANGOHUD_BRANCH = simple-image-loader

MANGOHUD_DEPENDENCIES = host-libcurl host-python-mako host-glslang dbus

ifeq ($(BR2_PACKAGE_LIBDRM),y)
	MANGOHUD_DEPENDENCIES += libdrm
endif

ifeq ($(BR2_PACKAGE_XSERVER_XORG_SERVER),y)
	MANGOHUD_DEPENDENCIES += xserver_xorg-server
endif

MANGOHUD_CONF_ENV += SSL_CERT_DIR=/etc/ssl/certs
MANGOHUD_CONF_OPTS = -Dwith_xnvctrl=disabled -Dtests=disabled

ifeq ($(BR2_PACKAGE_BATOCERA_VULKAN),y)
	MANGOHUD_DEPENDENCIES += vulkan-headers
	MANGOHUD_CONF_OPTS += -Duse_vulkan=true
else
	MANGOHUD_CONF_OPTS += -Duse_vulkan=false
endif

ifeq ($(BR2_PACKAGE_XORG7),y)
	MANGOHUD_CONF_OPTS += -Dwith_x11=enabled
else
	MANGOHUD_CONF_OPTS += -Dwith_x11=disabled
endif

ifeq ($(BR2_PACKAGE_BATOCERA_WAYLAND),y)
	MANGOHUD_DEPENDENCIES += wayland
	MANGOHUD_CONF_OPTS += -Dwith_wayland=enabled
else
	MANGOHUD_CONF_OPTS += -Dwith_wayland=disabled
endif

$(eval $(meson-package))
